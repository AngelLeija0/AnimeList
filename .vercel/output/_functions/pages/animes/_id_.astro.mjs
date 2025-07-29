import { c as createComponent, a as createAstro, e as renderComponent, d as renderTemplate, m as maybeRenderHead, b as addAttribute, g as renderTransition } from '../../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../../chunks/Layout_Dq6VfChX.mjs';
import { $ as $$Main } from '../../chunks/Main_m9IkjFmI.mjs';
import { A as AnimeService } from '../../chunks/animeService_Diipd3Ol.mjs';
/* empty css                                    */
export { renderers } from '../../renderers.mjs';

const $$Astro = createAstro();
const prerender = false;
const $$id = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$id;
  const { id } = Astro2.params;
  const anime = await AnimeService.getById(id);
  if (!anime) return Astro2.redirect("/");
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": anime.title }, { "default": async ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, { "footer": "false" }, { "default": async ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="w-full min-h-screen relative pt-30 flex flex-col"> <a href="javascript:history.back()" class="absolute top-0 left-10 mt-30 z-10 text-white bg-white/30 hover:bg-white/20 p-2 rounded-lg cursor-pointer"> <svg class="size-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M15 6l-6 6l6 6"></path></svg> </a> <div class="relative z-5 flex flex-col md:flex-row gap-8 pb-10 px-4 sm:px-6 md:px-8 w-full max-w-5xl mx-auto"> <div class="relative shrink-0 w-full md:w-80 h-auto md:h-auto"> <img${addAttribute(anime.image_src, "src")}${addAttribute(anime.title, "alt")} class="w-full h-auto object-cover rounded-2xl overflow-hidden"${addAttribute(renderTransition($$result3, "n7mwzika", "", `anime-image-${anime.id}`), "data-astro-transition-scope")}> </div> <div class="flex flex-col pt-4 md:pt-1"> <h1 class="text-3xl md:text-4xl text-white font-bold mb-2 flex flex-wrap items-end gap-3"> ${anime.title} <span class="text-xs bg-white text-black font-medium px-1.5 py-0.5 rounded-md"> ${anime.age_rating} </span> </h1> <h2 class="text-zinc-100 text-base font-medium mb-3">
Original title: ${anime.original_title} </h2> <span class="text-base font-semibold mb-3 text-yellow-400">
☆ ${anime.imdb_rate || "N/A"} </span> <p class="text-base text-zinc-200 font-medium">${anime.overview}</p> <div class="mt-6 flex flex-col"> <p class="text-sm text-zinc-200 font-medium pb-2">Genres</p> <div class="flex flex-wrap gap-x-2 gap-y-2"> ${anime?.genres?.map((genre) => renderTemplate`<span class="text-sm text-zinc-100 border border-zinc-400 px-2 py-0.5 rounded-full"> ${genre} </span>`)} </div> </div> <div class="mt-6 flex flex-col"> <h3 class="text-base text-zinc-200 font-medium pb-2">Seasons <span class="text-xs">(${anime.total_episodes || 0} episodes)</span></h3> <div class="flex flex-col gap-1"> ${anime?.seasons?.map((season) => renderTemplate`<div class="flex items-end gap-2"> <span class="text-sm text-white">
Season ${season.season_number} </span> <span class="text-xs text-zinc-300 pb-0.5">
/ ${season.release_date} </span> </div>`)} </div> </div> </div> </div> <img${addAttribute(anime.image_src, "src")}${addAttribute(anime.title, "alt")} class="absolute z-0 top-0 left-0 w-full h-full object-cover object-center"> <div class="absolute z-1 top-0 w-full h-full backdrop-blur-md bg-black/60"></div> </section> ` })} ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/animes/[id].astro", "self");

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/animes/[id].astro";
const $$url = "/animes/[id]";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$id,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
