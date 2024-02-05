# Base image composer,node and php
FROM --platform=linux/amd64 composer:2.3.5 AS composer
FROM --platform=linux/amd64 node:16.15.0 AS node
FROM --platform=linux/amd64 php:7.3-apache

# Update all package 
RUN apt update -y

# SQL Server
RUN apt-get install -y curl apt-transport-https gnupg2
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev

# Install the PHP extension installer that will install and configure the extension, but will also install all dependencies.
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

# Install the ZIP extension since Composer requires it
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions zip sqlsrv pdo_sqlsrv gd

# Copy the composer binary to the container
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Set composer home directory
ENV COMPOSER_HOME=/.composer

# Composer needs to run as root to allow the use of a bind-mounted cache volume
ENV COMPOSER_ALLOW_SUPERUSER=1

# Set NodeJS
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

# SSL Conf Apache
COPY openssl.cnf /etc/ssl/openssl.cnf

# Enable headers/rewrite module for Apache
RUN a2enmod headers rewrite

# Set document root for Apache (only for laravel)
# ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Create the project root folder and assign ownership to the pre-existing www-data user
RUN mkdir -p /var/www/html /.composer && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# Copy just the composer dependencies to the container. This should lead to a more efficient
# build cache since the 'composer install' cache-layer should only break if one of these two
# files has changed.
COPY --chown=www-data composer.json composer.lock package.json package-lock.json /var/www/html/

# Install all composer dependencies without running the autoloader and the scripts since these
# actions rely on the source files of the application.
# Also, volume mounting a bind-mounted cache to composer's /.composer folder helps speeding up the build
# since even when you break the cache by adding/removing a composer package, all previously installed
# packages are served from the mounted cache.
RUN --mount=type=cache,target=/.composer/cache composer install --no-autoloader --no-scripts
RUN npm install
RUN npm install pm2 -g

# Copy the rest of the source code to the container. Now, if source files are changed, the cache-layer
# breaks here and the only the 'composer dump-autoload' command will have to run again.
COPY --chown=www-data . /var/www/html/

# Generate an optimized autoloader after copying the source files to the container
RUN composer dump-autoload --optimize

# Change ownership of the root folder to www-data
RUN chown -R www-data:www-data vendor/ node_modules/

# add bind host 0.0.0.0 create server inertia
RUN sed -ri -e 's!_port,!_port,"0.0.0.0",!g' /var/www/html/node_modules/@inertiajs/server/lib/index.js
RUN sed -ri -e 's!Starting SSR server!Starting SSR server on host 0.0.0.0!g' /var/www/html/node_modules/@inertiajs/server/lib/index.js

# Production Node
RUN npm run prod

# SSR 
RUN pm2 start /var/www/html/public/js/ssr.js --name daftarsulfat-ssr