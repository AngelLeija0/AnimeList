<template>
  <article class="w-full h-full relative" :id="`anime-card-${anime.id}`">
    <AnimeListButton
      v-if="session"
      :session="session"
      :anime-id="anime.id"
      :show-status="showStatus"
      :class="`absolute z-50 ${!showStatus ? 'top-2 right-2' : 'top-0 left-0 w-full p-2'}`"
      @update-status="handleEmitUpdateStatus"
    />

    <a
      :href="`/animes/${anime.id}`"
      class="overflow-hidden relative group cursor-pointer"
    >
      <div
        class="relative w-full h-full rounded-xl overflow-hidden bg-zinc-700 animate-pulse"
        ref="imageContainer"
      >
        <img
          :src="anime.image_src"
          :alt="anime.title"
          loading="lazy"
          class="w-full h-full object-cover rounded-xl opacity-0 transition-opacity duration-500"
          @load="onImageLoad"
        />
      </div>

      <div
        class="hidden group-hover:flex transition-all duration-1000 absolute top-0 z-3 left-0 w-full h-full background-blur-sm p-8 flex-col rounded-xl"
      >
        <div class="flex flex-col flex-1">
          <h5 class="text-2xl text-white font-bold mb-1">
            {{ anime.title }}
          </h5>
          <span class="text-sm font-semibold mb-3 text-yellow-400">
            ☆ {{ anime.imdb_rate || "N/A" }}
          </span>
          <p class="text-sm text-zinc-200 font-medium">
            {{ anime.overview }}
          </p>
        </div>
      </div>
    </a>
  </article>
</template>

<script setup>
import { ref } from "vue";
import AnimeListButton from "@/components/AnimeListButton.vue";

const props = defineProps({
  anime: {
    type: Object,
    required: true
  },
  className: {
    type: String,
    default: "",
  },
  session: {
    type: Object,
    default: null,
  },
  showStatus: {
    type: Boolean,
    default: false,
  },
});

const emits = defineEmits(["reload"]);

const imageContainer = ref(null);

const onImageLoad = (event) => {
  const img = event.target;
  img.style.opacity = "1";
  if (imageContainer.value) {
    imageContainer.value.classList.remove("animate-pulse", "bg-zinc-700");
  }
};

const handleEmitUpdateStatus = () => {
  emits("reload")
}

</script>