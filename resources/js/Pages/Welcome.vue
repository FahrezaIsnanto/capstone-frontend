<template>
    <div class="fixed bottom-[10px] right-[10px]">
        <a
            href="https://wa.me/6281575757278?text=Halo+RSUD+Sultan+Fatah+Kabupaten+Demak"
            target="_blank"
            ><img src="/images/chatwa.png" class="h-[55px] md:h-[85px]"
        /></a>
    </div>
    <div class="w-full block md:flex -mt-10">
        <div>
            <p
                class="font-poppins text-primary mt-16 text-lg tracking-wide mb-5"
            >
                Pendaftaran Online 
            </p>
            <h1
                class="font-bold tracking-wider text-lg md:text-2xl font-poppins text-black mb-5 leading-8 md:leading-10"
            >
                Daftar Lebih Mudah di RSUD Sultan Fatah<span class="md:block"></span> Kabupaten Demak
                Dimana Saja Kapan Saja
            </h1>
            <p class="font-poppin mt-2 text-black text-lg font-light mb-10 leading-8">
                Daftar online dari rumah sesuai tanggal periksa yang diinginkan
            </p>
            <Link
                class="bg-primary hover:bg-primary-dark text-white rounded-xl font-poppins tracking-widest px-6 py-3"
                href="/start"
            >
                Daftar Sekarang
            </Link>
        </div>
        <div class="ml-auto">
            <WelcomeImage class="mt-10 w-96 md:w-[440px]" />
        </div>
    </div>
    <div class="mb-5">
        <p
                class="font-poppins text-primary mt-16 text-lg tracking-wide mb-5"
            >
                Fitur Andalan
            </p>
    </div>
    <div class="mb-5 md:grid md:grid-cols-12 md:gap-4">
        <div class="col-span-3 mb-2">
            <div
                class="max-w-sm rounded-lg overflow-hidden shadow-lg hover:cursor-pointer transform transition duration-500 hover:scale-105 bg-primary h-[220px]"
            >
                <!-- <img class="w-full" src="/images/status_antrian.png"> -->
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-5 text-white text-center">
                        ANTRIAN POLIKLINIK
                    </div>
                    <p class="text-white text-base mb-5 leading-7">
                        Cek status Antrian Dan Kepadatan Poliklinik Secara Online
                    </p>
                    <Link
                        class="bg-white text-center text-sm w-full flex justify-center items-center mx-auto p-5 box-border rounded-lg"
                        href="/antrian_poli"
                        >👋 LIHAT</Link
                    >
                </div>
            </div>
        </div>
        <div class="col-span-3 mb-2">
            <div
                class="max-w-sm rounded-lg overflow-hidden shadow-lg hover:cursor-pointer transform transition duration-500 hover:scale-105 bg-primary h-[220px]"
            >
                <!-- <img class="w-full" src="/images/status_antrian.png"> -->
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-5 text-white text-center">
                        ANTRIAN TOTAL
                    </div>
                    <p class="text-white text-base mb-5 leading-7">
                        Cek status Rekapitulasi Antrian Total Rumah Sakit
                    </p>
                    <Link
                        class="bg-white text-center text-sm w-full flex justify-center items-center mx-auto p-5 box-border rounded-lg"
                        href="/antrian_total"
                        >👋 LIHAT</Link
                    >
                </div>
            </div>
        </div>
        <div class="col-span-3 mb-2">
            <div
                class="max-w-sm rounded-lg overflow-hidden shadow-lg hover:cursor-pointer transform transition duration-500 hover:scale-105 bg-primary h-[220px]"
            >
                <!-- <img class="w-full" src="/images/status_antrian.png"> -->
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-5 text-white text-center">
                        JADWAL DOKTER
                    </div>
                    <p class="text-white text-base mb-5 leading-7">
                        Cek Jadwal Dokter Sesuai Tanggal Periksa yang diingingkan.
                    </p>
                    <Link
                        class="bg-white text-center text-sm w-full flex justify-center items-center mx-auto p-5 box-border rounded-lg"
                        href="/jadwal_dokter"
                        >👋 LIHAT</Link
                    >
                </div>
            </div>
        </div>
        <div class="col-span-3 mb-2">
            <div
                class="max-w-sm rounded-lg overflow-hidden shadow-lg hover:cursor-pointer transform transition duration-500 hover:scale-105 bg-primary h-[220px]"
            >
                <!-- <img class="w-full" src="/images/status_antrian.png"> -->
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-5 text-white text-center">
                        PANTAU CCTV
                    </div>
                    <p class="text-white text-base mb-5 leading-7">
                        Pantau CCTV online Rumah Sakit Secara Real Time.
                    </p>
                    <a class="bg-white text-center text-sm w-full flex justify-center items-center mx-auto p-5 box-border rounded-lg" href="/pantau_cctv">
                        👋 LIHAT
                    </a>
                    <!-- <Link
                        class="bg-white text-center text-sm w-full flex justify-center items-center mx-auto p-5 box-border rounded-lg"
                        href="/pantau_cctv"
                        >👋 LIHAT</Link
                    > -->
                </div>
            </div>
        </div>
    </div>
    <div class="mb-5 -mt-3">
        <p
                class="font-poppins text-primary mt-16 text-lg tracking-wide mb-5"
            >
                Hubungi Kami
            </p>
    </div>
    <div class="mb-5">
        <Contact/>
    </div>
</template>

<script>
import { Link } from "@inertiajs/inertia-vue3";
import WelcomeImage from "../Shared/WelcomeImage.vue";
import WelcomeLayout from "../Shared/WelcomeLayout.vue";
import Contact from "../Shared/Contact.vue";

export default {
    components: {
        Link,
        WelcomeImage,
        Contact
    },
    props: {
        
    },
    layout: WelcomeLayout,
};
</script>
