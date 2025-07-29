import { c as createComponent, m as maybeRenderHead, e as renderComponent, f as renderScript, b as addAttribute, d as renderTemplate, a as createAstro } from '../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_Dq6VfChX.mjs';
import { $ as $$Main } from '../chunks/Main_m9IkjFmI.mjs';
import { $ as $$Link } from '../chunks/Link_DuiNf6sP.mjs';
import { A as AnimeService } from '../chunks/animeService_Diipd3Ol.mjs';
import { $ as $$AnimeCard } from '../chunks/AnimeCard_DMGb6vb3.mjs';
import 'clsx';
export { renderers } from '../renderers.mjs';

const $$Hero = createComponent(async ($$result, $$props, $$slots) => {
  const animes = await AnimeService.get({
    size: 10,
    filters: {
      has_background_image: true
    }
  });
  return renderTemplate`${maybeRenderHead()}<section class="w-full h-screen"> <div class="w-full h-full relative"> <div class="absolute bottom-5 sm:bottom-auto sm:top-1/2 left-0 z-10 transform sm:-translate-y-1/2"> <div class="flex flex-col p-8 sm:max-w-110"> <h1 class="text-5xl sm:text-6xl text-white font-bold mb-8">Welcome to AnimeList</h1> <p class="text-base text-zinc-200 font-medium mb-4">
Browse through thousands of anime titles and start building your
          personal watchlist today.
</p> <div class="flex min-w-35 max-w-1/2"> ${renderComponent($$result, "Link", $$Link, { "href": "/my-anime-list" }, { "default": async ($$result2) => renderTemplate`Start Now` })} </div> </div> </div> <div class="w-full h-full relative"> ${animes.map((anime, i) => renderTemplate`<img${addAttribute(anime.background_image_src || "", "src")}${addAttribute(anime.title || "Image", "alt")}${addAttribute(1920, "width")}${addAttribute(762, "height")} loading="lazy" class="hero-image object-cover z-1 h-full w-full">`)} <div class="hidden sm:block absolute top-0 left-0 z-2 h-full min-w-140 w-1/2 bg-gradient-to-r from-black/95 via-black/80 to-transparent pointer-events-none"></div> <div class="absolute bottom-0 z-2 left-0 w-full h-full md:h-24 bg-gradient-to-t from-black/90 via-black/50 to-transparent pointer-events-none"></div> </div> </div> </section> ${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Hero.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Hero.astro", void 0);

const $$CategoryPreview = createComponent(async ($$result, $$props, $$slots) => {
  const categories = [
    {
      title: "More recents",
      items: await AnimeService.get({
        size: 12,
        sortBy: "release_date:desc"
      }),
      page: "/animes?category=recents"
    },
    {
      title: "Most popular",
      items: await AnimeService.get({
        size: 12,
        sortBy: "imdb_rate:desc"
      }),
      page: "/animes?category=populars"
    }
  ];
  return renderTemplate`${maybeRenderHead()}<section class="flex flex-col px-8 py-8 mb-4 gap-12"> ${categories.map((category) => renderTemplate`<div class="flex flex-col"> <div class="flex mb-6"> <h2 class="text-2xl text-white font-semibold">${category.title}</h2> </div> <div class="flex gap-4 relative overflow-hidden"> ${category.items.map((anime) => renderTemplate`${renderComponent($$result, "AnimeCard", $$AnimeCard, { "anime": anime, "className": "min-w-78" })}`)} <a${addAttribute(category.page, "href")} class="absolute z-10 top-1/2 -right-5 -translate-y-1/2 h-full w-20 bg-black/60 hover:bg-black/70 flex items-center justify-center"> <span class="rotate-270 text-white text-sm font-semibold cursor-pointer">
Ver más
</span> </a> </div> </div>`)} </section>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/CategoryPreview.astro", void 0);

const $$Astro = createAstro();
const $$Footer = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Footer;
  return renderTemplate`${maybeRenderHead()}<footer class="w-full md:max-w-3xl mx-auto mt-20 px-4 pb-8 flex flex-col items-center text-center text-sm"> <div class="flex flex-col items-center mb-4"> <h2 class="text-lg font-bold mb-2 text-zinc-300">AnimeList</h2> <p class="text-sm font-medium text-zinc-400">
A web application to explore and manage anime lists. Built with Astro, Vue.js, Tailwind CSS, Supabase, and Google Auth. Anime data sourced from
<a href="https://www.crunchyroll.com/" target="_blank" rel="noopener noreferrer" class="underline hover:text-orange-600 dark:hover:text-orange-400">Crunchyroll</a>.
</p> </div> <p class="font-semibold text-zinc-400 mt-1">
&copy; 2025 Angel Leija. All rights reserved.
</p> </footer>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Footer.astro", void 0);

const prerender = false;
const $$Index = createComponent(($$result, $$props, $$slots) => {
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Home" }, { "default": ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": ($$result3) => renderTemplate` ${renderComponent($$result3, "Hero", $$Hero, {})} ${renderComponent($$result3, "CategoryPreview", $$CategoryPreview, {})} ${renderComponent($$result3, "Footer", $$Footer, {})} ` })} ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/index.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/index.astro";
const $$url = "";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Index,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
