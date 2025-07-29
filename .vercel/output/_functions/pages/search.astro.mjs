import { c as createComponent, e as renderComponent, f as renderScript, d as renderTemplate, m as maybeRenderHead, b as addAttribute } from '../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_Dq6VfChX.mjs';
import { $ as $$Main } from '../chunks/Main_m9IkjFmI.mjs';
import { $ as $$Link } from '../chunks/Link_DuiNf6sP.mjs';
import { A as AnimeService } from '../chunks/animeService_Diipd3Ol.mjs';
export { renderers } from '../renderers.mjs';

const prerender = false;
const $$Search = createComponent(async ($$result, $$props, $$slots) => {
  const animesPreview = await AnimeService.get({
    size: 20,
    sortBy: "imdb_rate:desc"
  });
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Search" }, { "default": async ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": async ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="mt-30 p-4 sm:p-8 flex flex-col items-center justify-center"> <h1 class="text-4xl text-white font-bold mb-8">Search an anime</h1> <div class="relative w-full max-w-150 mb-8"> <input id="search-input" type="text" placeholder="" class="border border-zinc-700 bg-zinc-900 text-lg text-white px-4 py-4 w-full rounded-2xl"> <div class="absolute top-0 right-0 h-full flex items-center p-2"> ${renderComponent($$result3, "Link", $$Link, { "id": "search-link", "className": "py-[0.7rem]" }, { "default": async ($$result4) => renderTemplate`Search` })} </div> </div> <div class="flex gap-4 overflow-hidden relative carousel"> ${animesPreview.map((anime) => renderTemplate`<img${addAttribute(anime.image_src, "src")} class="carousel-items min-w-50 h-auto rounded-2xl overflow-hidden">`)} <div class="absolute top-0 left-0 w-full h-full bg-black/30"></div> </div> </section> ` })} ` })} ${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/search.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/search.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/search.astro";
const $$url = "/search";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Search,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
