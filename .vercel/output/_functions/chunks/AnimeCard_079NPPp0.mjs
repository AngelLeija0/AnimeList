import { c as createComponent, a as createAstro, m as maybeRenderHead, b as addAttribute, e as renderComponent, d as renderTemplate, g as renderTransition } from './astro/server_Dkgk-V3U.mjs';
import 'kleur/colors';
import { mergeProps, ref, onMounted, useSSRContext } from 'vue';
import { toast } from 'vue-sonner';
import gsap from 'gsap';
import { ssrRenderAttrs, ssrRenderClass, ssrInterpolate, ssrRenderStyle, ssrRenderList, ssrRenderAttr } from 'vue/server-renderer';
import './index_BRwviSIQ.mjs';
import { $ as $$Image } from './_astro_assets_Dym1OEgN.mjs';
/* empty css                         */

const statuses = ['planned', 'watching', 'watched', 'dropped'];

const statusColors = {
  planned: "text-blue-400",
  watching: "text-yellow-400",
  watched: "text-green-400",
  dropped: "text-red-400"
};

const _export_sfc = (sfc, props) => {
  const target = sfc.__vccOpts || sfc;
  for (const [key, val] of props) {
    target[key] = val;
  }
  return target;
};

const _sfc_main = {
  __name: 'AnimeListButton',
  props: {
  animeId: String,
  session: Object,
  showStatus: Boolean,
  className: String
},
  emits: ["update-status"],
  setup(__props, { expose: __expose, emit: __emit }) {
  __expose();

const props = __props;

const emits = __emit;

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

const __returned__ = { props, emits, menu, addButton, isAdded, currentStatus, showStatusMenu, statusMenu, get hoverTimeout() { return hoverTimeout }, set hoverTimeout(v) { hoverTimeout = v; }, showMenu, hideMenu, toggleStatusMenu, rotateButton, addAnime, updateStatus, removeAnime, ref, onMounted, get toast() { return toast }, get statuses() { return statuses }, get statusColors() { return statusColors }, get gsap() { return gsap } };
Object.defineProperty(__returned__, '__isScriptSetup', { enumerable: false, value: true });
return __returned__
}

};

function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  _push(`<div${ssrRenderAttrs(mergeProps({
    class: `${$props.className} flex items-center justify-between gap-4`
  }, _attrs))}>`);
  if ($props.showStatus && $setup.currentStatus) {
    _push(`<div class="relative"><button type="button" class="${
      ssrRenderClass(`${$setup.statusColors[$setup.currentStatus]} border-2 background-blur-2xl hover:bg-black/80 text-sm font-medium capitalize px-3 py-1 rounded-full cursor-pointer`)
    }">${
      ssrInterpolate($setup.currentStatus)
    }</button><div style="${
      ssrRenderStyle(($setup.showStatusMenu) ? null : { display: "none" })
    }" class="absolute z-50 w-36 mt-2 left-0 flex flex-col bg-black/80 text-white shadow-lg rounded-xl overflow-hidden opacity-0 pointer-events-none">`);
    if (_ctx.status !== $setup.currentStatus) {
      _push(`<!--[-->`);
      ssrRenderList($setup.statuses, (status) => {
        _push(`<button class="w-full text-left px-3 py-2 hover:bg-white hover:text-black transition-colors cursor-pointer">${ssrInterpolate(status.charAt(0).toUpperCase() + status.slice(1))}</button>`);
      });
      _push(`<!--]-->`);
    } else {
      _push(`<!---->`);
    }
    _push(`</div></div>`);
  } else {
    _push(`<!---->`);
  }
  if ($setup.isAdded) {
    _push(`<button${ssrRenderAttr("data-id", $props.animeId)} data-action="remove" class="anime-list-button max-w-fit flex items-center justify-center p-2 text-black bg-white/90 hover:bg-zinc-200 rounded-lg cursor-pointer transition-colors"><svg class="size-4" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12l5 5l10 -10"></path></svg></button>`);
  } else {
    _push(`<div class="relative"><button type="button"${ssrRenderAttr("data-id", $props.animeId)} data-action="add" class="anime-list-button max-w-fit flex items-center justify-center p-2 text-white bg-black/90 hover:bg-white/90 hover:text-black rounded-lg cursor-pointer transition-colors"><svg class="size-4" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 5l0 14"></path><path d="M5 12l14 0"></path></svg></button><div class="absolute top-8 right-0 w-40 pt-2 flex-col z-50 shadow-lg opacity-0 pointer-events-none"><!--[-->`);
    ssrRenderList($setup.statuses, (status) => {
      _push(`<button${
        ssrRenderAttr("data-status", status)
      } class="${
        ssrRenderClass([{
            'rounded-t-xl': status === 'planned',
            'rounded-b-xl': status === 'dropped'
          }, "w-full bg-black/80 hover:bg-white/80 hover:text-black text-white cursor-pointer px-2 py-1"])
      }">${
        ssrInterpolate(status.charAt(0).toUpperCase() + status.slice(1))
      }</button>`);
    });
    _push(`<!--]--></div></div>`);
  }
  _push(`</div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext()
  ;(ssrContext.modules || (ssrContext.modules = new Set())).add("src/components/AnimeListButton.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : undefined
};
const AnimeListButton = /*#__PURE__*/_export_sfc(_sfc_main, [['ssrRender',_sfc_ssrRender]]);

const $$Astro = createAstro();
const $$AnimeCard = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$AnimeCard;
  const { anime, className = "", session = null, showStatus = false } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<article${addAttribute(`w-full h-full relative ${className}`, "class")}${addAttribute(`anime-card-${anime.id}`, "id")}> ${session ? renderTemplate`${renderComponent($$result, "AnimeListButton", AnimeListButton, { "client:visible": true, "session": session, "animeId": anime.id, "showStatus": showStatus, "className": `absolute z-50 ${!showStatus ? "top-2 right-2" : "top-0 left-0 w-full p-2"}`, "client:component-hydration": "visible", "client:component-path": "@/components/AnimeListButton.vue", "client:component-export": "default" })}` : null} <a${addAttribute(`animes/${anime.id}`, "href")} data-astro-prefetch class="overflow-hidden relative group cursor-pointer"> <div class="relative w-full h-full rounded-xl overflow-hidden bg-zinc-700 animate-pulse"> ${renderComponent($$result, "Image", $$Image, { "src": anime.image_src, "alt": anime.title, "width": 1920, "height": 762, "loading": "lazy", "class": "w-full h-full object-cover rounded-xl opacity-0 transition-opacity duration-500", "onload": "this.style.opacity='1'; this.parentElement.classList.remove('animate-pulse', 'bg-zinc-700')", "data-astro-transition-scope": renderTransition($$result, "73wb3hb4", "", `anime-image-${anime.id}`) })} </div> <div class="hidden group-hover:flex transition-all duration-1000 absolute top-0 z-3 left-0 w-full h-full background-blur-sm p-8 flex-col rounded-xl"> <div class="flex flex-col flex-1"> <h5 class="text-2xl text-white font-bold mb-1"> ${anime.title} </h5> <span class="text-sm font-semibold mb-3 text-yellow-400">
☆ ${anime.imdb_rate || "N/A"} </span> <p class="text-sm text-zinc-200 font-medium"> ${anime.overview} </p> </div> </div> </a> </article>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/AnimeCard.astro", "self");

export { $$AnimeCard as $ };
