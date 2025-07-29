import { c as createComponent, e as renderComponent, d as renderTemplate, m as maybeRenderHead, b as addAttribute } from '../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_Dq6VfChX.mjs';
import { $ as $$Main } from '../chunks/Main_m9IkjFmI.mjs';
import { A as AnimeService } from '../chunks/animeService_Diipd3Ol.mjs';
export { renderers } from '../renderers.mjs';

const prerender = false;
const $$Categories = createComponent(($$result, $$props, $$slots) => {
  const categories = {
    genres: AnimeService.getGenders(),
    age_ratings: AnimeService.getAgeRatings()
  };
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Categories" }, { "default": ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="mt-20 p-8 flex flex-col items-center justify-center"> <h1 class="text-4xl text-white font-bold mb-8">Explore the categories</h1> <div class="grid grid-cols-3 gap-4"> <div class="col-span-2 flex flex-col"> <h3 class="text-xl text-zinc-400 font-semibold mb-4">Genres</h3> <div class="grid grid-cols-4 gap-1"> ${categories.genres.map((genre) => renderTemplate`<a${addAttribute(`/animes?genre=${genre.toLowerCase()}`, "href")} class="text-base line-clamp-1">${genre}</a>`)} </div> </div> <div class="col-span-1 flex flex-col"> <h3 class="text-xl text-zinc-400 font-semibold mb-4">Age Ratings</h3> <div class="grid grid-cols-3 gap-y-1 gap-x-2"> ${categories.age_ratings.map((age_rate) => renderTemplate`<a${addAttribute(`/animes?age_rate=${age_rate.toLowerCase()}`, "href")} class="text-base line-clamp-1">${age_rate}</a>`)} </div> </div> </div> </section> ` })} ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/categories.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/categories.astro";
const $$url = "/categories";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Categories,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
