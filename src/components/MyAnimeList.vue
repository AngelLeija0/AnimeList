<template>
    <section class="flex flex-col px-8 mb-8">
        <div ref="navContainer"
            class="flex mb-6 border border-zinc-700 rounded-xl overflow-hidden max-w-fit mx-auto relative">
            <div ref="marker"
                class="marker-status absolute bg-white/40 rounded-xl z-10 transition-all duration-300 pointer-events-none">
            </div>
            <div v-for="(status, i) in statusesWithAll" :key="i">
                <button type="button"
                    class="nav-status text-white text-base font-medium px-6 py-3 capitalize w-full cursor-pointer transition-colors"
                    :class="{ 'font-bold': selectedStatus === status }" @click="selectStatus(status, $event)">
                    {{ status === 'all' ? 'All' : status }}
                </button>
            </div>
        </div>
        <div ref="cardsContainer"
            class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
            <AnimeCardReactive v-for="(record, i) in filteredAnimeList" :key="record.anime.id" :anime="record.anime"
                :session="session" :showStatus="true" @reload="fetchAnimeList" />
        </div>
    </section>
</template>

<script setup>
import { ref, computed, onMounted, nextTick } from "vue";
import { statuses } from "@/lib/status";
import AnimeCardReactive from "@/components/AnimeCardReactive.vue";
import gsap from "gsap";
import Flip from "gsap/Flip";

const props = defineProps({
    session: {
        type: Object,
        required: true,
    },
});

const viewType = ref("grid");

const statusesWithAll = ['all', ...statuses];
const selectedStatus = ref('all');
const userAnimeList = ref([]);

const navContainer = ref(null);
const marker = ref(null);

const filteredAnimeList = computed(() =>
    selectedStatus.value === 'all'
        ? userAnimeList.value
        : userAnimeList.value.filter(record => record.status === selectedStatus.value)
);

const fetchAnimeList = async () => {
    try {
        const res = await fetch(`/api/users_animes.json`);
        const data = await res.json();
        userAnimeList.value = data;
    } catch (err) {
        console.error("Error al obtener la lista de animes:", err);
    }
};

const updateMarkerPosition = (el) => {
    if (!marker.value || !navContainer.value) return;

    const state = Flip.getState(marker.value);
    const bounds = el.getBoundingClientRect();
    const containerBounds = navContainer.value.getBoundingClientRect();

    gsap.set(marker.value, {
        width: bounds.width,
        height: bounds.height,
        x: bounds.left - containerBounds.left,
        y: bounds.top - containerBounds.top,
    });

    Flip.from(state, {
        duration: 0.1,
        ease: "power2.out",
    });
};

const cardsContainer = ref(null);

const selectStatus = async (status, event) => {
    const state = Flip.getState(cardsContainer.value);

    selectedStatus.value = status;

    await nextTick();

    Flip.from(state, {
        duration: 0.3,
        ease: "power2.out",
        absolute: true,
        stagger: 0.02,
    });

    updateMarkerPosition(event.currentTarget);
};

// Montaje inicial
onMounted(async () => {
    gsap.registerPlugin(Flip);
    await fetchAnimeList();
    await nextTick();

    const activeButton = navContainer.value.querySelector(".nav-status.font-bold");
    if (activeButton) {
        updateMarkerPosition(activeButton);
    }
});
</script>