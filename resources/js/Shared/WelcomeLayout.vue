<template>
    <main>
        <Head>
            <link
                rel="icon"
                href="/images/icon.jpeg"
                type="image/gif"
                sizes="16x16"
            />
            <title>Sultan Fatah - Pendaftaran Online</title>
        </Head>
        <div
            class="text-md flex flex-wrap items-center justify-center gap-3 bg-[#fde9b1] px-6 py-4 font-medium"
        >
            <marquee>📪 Sahabat Menuju Sehat - Ini adalah contoh informasi</marquee>
        </div>
        <div class="flex justify-end">
            <Link class="mt-5 font-poppins font-light mr-5 hover:underline text-sm mb-10" href="/auth/login">
                👨‍💻 Menuju halaman login Manajemen ↗
            </Link>
        </div>
        <div class="container md:px-28">
            <slot />
        </div>
    </main>
</template>

<script>
import { Link } from "@inertiajs/inertia-vue3";
import { Head } from "@inertiajs/inertia-vue3";

export default {
    components: {
        Head,
        Link
    }
};
</script>