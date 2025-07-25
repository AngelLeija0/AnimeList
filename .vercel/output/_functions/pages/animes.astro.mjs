import { c as createComponent, a as createAstro, e as renderComponent, d as renderTemplate, m as maybeRenderHead } from '../chunks/astro/server_Btkud6ZY.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_B3f38Vbd.mjs';
import { $ as $$Main } from '../chunks/Main_ClStFmf0.mjs';
import { $ as $$Link } from '../chunks/Link_BysI70Mq.mjs';
import { $ as $$AnimeCard } from '../chunks/AnimeCard_mNBRfMUO.mjs';
import { A as AnimeService } from '../chunks/animeService_Diipd3Ol.mjs';
import { g as getSession } from '../chunks/server_CAuKSGxP.mjs';
export { renderers } from '../renderers.mjs';

const $$Astro = createAstro();
const prerender = false;
const $$Animes = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Animes;
  const session = await getSession(Astro2.request);
  const url = Astro2.url;
  const urlParams = url.searchParams;
  let pageSize = 50;
  const pageSizeParam = urlParams.get("pageSize");
  if (pageSizeParam !== null) {
    const parsed = Number(pageSizeParam);
    if (!isNaN(parsed) && Number.isInteger(parsed) && parsed > 0) {
      pageSize = parsed;
    }
  }
  let sortBy = "title:asc";
  const categoryParam = urlParams.get("category");
  if (categoryParam == "recents") sortBy = "release_date:desc";
  if (categoryParam == "populars") sortBy = "imdb_rate:desc";
  const filters = {
    genres: urlParams.get("genre") ? urlParams.get("genre").split(",") : null,
    age_rating: urlParams.get("age_rating") || null
  };
  let animes = [];
  const search = urlParams.get("q");
  if (search) {
    animes = await AnimeService.search({ value: search, size: pageSize });
  } else {
    animes = await AnimeService.get({ size: pageSize, sortBy, filters });
  }
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Animes" }, { "default": async ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": async ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="mt-14 p-8 flex flex-col mx-1"> <div class="flex justify-between items-center gap-6"> <h1 class="text-4xl text-white font-bold">Animes</h1> </div> ${search ? renderTemplate`<div class="mt-4"> <p class="text-lg text-zinc-400 font-semibold">Search: ${search}</p> </div>` : null} </section> <section class="px-8 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4 mb-8"> ${animes.map((anime) => renderTemplate`${renderComponent($$result3, "AnimeCard", $$AnimeCard, { "anime": anime, "session": session })}`)} </section> <div class="w-full max-w-fit mx-auto mb-8"> ${renderComponent($$result3, "Link", $$Link, { "href": `/animes${Astro2.url.search}&pageSize=${pageSize + 20}` }, { "default": async ($$result4) => renderTemplate` Cargar mas` })} </div> ` })} ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/animes.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/animes.astro";
const $$url = "/animes";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Animes,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
