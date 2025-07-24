<template>
  <div :class="`${className} flex items-center justify-between gap-4`">
    <div v-if="showStatus && currentStatus" class="relative">
      <button type="button" @click="toggleStatusMenu"
        :class="`${statusColors[currentStatus]} border-2 background-blur-2xl hover:bg-black/80 text-sm font-medium capitalize px-3 py-1 rounded-full cursor-pointer`">
        {{ currentStatus }}
      </button>
      <div v-show="showStatusMenu" ref="statusMenu"
        class="absolute z-50 w-36 mt-2 left-0 flex flex-col bg-black/80 text-white shadow-lg rounded-xl overflow-hidden opacity-0 pointer-events-none">
        <button v-for="status in statuses" :key="status" v-if="status !== currentStatus" @click="updateStatus(status)"
          class="w-full text-left px-3 py-2 hover:bg-white hover:text-black transition-colors cursor-pointer">
          {{ status.charAt(0).toUpperCase() + status.slice(1) }}
        </button>
      </div>
    </div>
    <button v-if="isAdded" @click="removeAnime" :data-id="animeId" data-action="remove"
      class="anime-list-button max-w-fit flex items-center justify-center p-2 text-black bg-white/90 hover:bg-zinc-200 rounded-lg cursor-pointer transition-colors">
      <svg class="size-4" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
        stroke-linecap="round" stroke-linejoin="round">
        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
        <path d="M5 12l5 5l10 -10" />
      </svg>
    </button>
    <div v-else class="relative" @mouseenter="showMenu" @mouseleave="hideMenu">
      <button ref="addButton" type="button" :data-id="animeId" data-action="add"
        class="anime-list-button max-w-fit flex items-center justify-center p-2 text-white bg-black/90 hover:bg-white/90 hover:text-black rounded-lg cursor-pointer transition-colors"
        @mouseenter="rotateButton" @click="addAnime()">
        <svg class="size-4" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
          stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
          <path d="M12 5l0 14" />
          <path d="M5 12l14 0" />
        </svg>
      </button>
      <div ref="menu" class="absolute top-8 right-0 w-40 pt-2 flex-col z-50 shadow-lg opacity-0 pointer-events-none">
        <button v-for="status in statuses" :key="status" @click="addAnime(status)" :data-status="status"
          class="w-full bg-black/80 hover:bg-white/80 hover:text-black text-white cursor-pointer px-2 py-1" :class="{
            'rounded-t-xl': status === 'planned',
            'rounded-b-xl': status === 'dropped'
          }">
          {{ status.charAt(0).toUpperCase() + status.slice(1) }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { toast } from "vue-sonner";
import { statuses, statusColors } from "@/lib/status";
import gsap from "gsap";

const props = defineProps({
  animeId: String,
  session: Object,
  showStatus: Boolean,
  className: String
});

const emits = defineEmits(["update-status"]);

const menu = ref(null);
const addButton = ref(null);
const isAdded = ref(false);
const currentStatus = ref('');
const showStatusMenu = ref(false);
const statusMenu = ref(null);

let hoverTimeout;

onMounted(async () => {
  const res = await fetch(`/api/users_animes.json?animeId=${props.animeId}`);
  const data = await res.json();

  isAdded.value = data?.anime_id ? true : false;
  currentStatus.value = data?.status;
});

function showMenu() {
  clearTimeout(hoverTimeout);
  gsap.to(menu.value, {
    opacity: 1,
    y: 0,
    pointerEvents: 'auto',
    duration: 0.3,
    ease: 'power2.out'
  });
}

function hideMenu() {
  hoverTimeout = setTimeout(() => {
    gsap.to(menu.value, {
      opacity: 0,
      y: -10,
      pointerEvents: 'none',
      duration: 0.2,
      ease: 'power2.inOut'
    });
    gsap.to(addButton.value, {
      rotate: 0,
      duration: 0.6,
      ease: 'power2.out'
    });
  }, 100);
}

function toggleStatusMenu() {
  showStatusMenu.value = !showStatusMenu.value;

  if (showStatusMenu.value) {
    gsap.fromTo(
      statusMenu.value,
      { opacity: 0, y: -10 },
      { opacity: 1, y: 0, duration: 0.2, pointerEvents: 'auto' }
    );
  } else {
    gsap.to(statusMenu.value, {
      opacity: 0,
      y: -10,
      duration: 0.2,
      pointerEvents: 'none',
    });
  }
}

function rotateButton() {
  gsap.to(addButton.value, {
    rotate: 180,
    duration: 0.6,
    ease: 'power2.out'
  });
}

async function addAnime(status = "planned") {
  try {
    const response = await fetch('/api/users_animes.json', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ animeId: props.animeId, status })
    });

    if (response.ok) {
      isAdded.value = true;
      currentStatus.value = status;
      toast.success("Anime added correctly");
      hideMenu();
    }
  } catch (error) {
    toast.error("Error adding anime");
    console.error('Error al agregar anime:', error);
  }
}

async function updateStatus(status) {
  try {
    const response = await fetch('/api/users_animes.json', {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ animeId: props.animeId, status })
    });

    if (response.ok) {
      currentStatus.value = status;
      toast.success("Status updated");
      toggleStatusMenu();
      emits("update-status");
    }
  } catch (error) {
    toast.error("Error updating status");
    console.error("Error al actualizar status:", error);
  }
}

async function removeAnime() {
  try {
    const response = await fetch('/api/users_animes.json', {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ animeId: props.animeId })
    });

    if (response.ok) {
      isAdded.value = false;
      currentStatus.value = '';
      toast.success("Anime remove correctly");
      if (props.showStatus) {
        const animeElement = document.querySelector(`#anime-card-${props.animeId}`);
        if (animeElement) {
          animeElement.remove();
        }
      }
    }
  } catch (error) {
    toast.error("Error removing anime");
    console.error('Error al eliminar anime:', error);
  }
}
</script>