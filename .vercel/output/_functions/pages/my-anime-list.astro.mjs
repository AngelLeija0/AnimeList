import { c as createComponent, a as createAstro, e as renderComponent, d as renderTemplate, m as maybeRenderHead } from '../chunks/astro/server_Dkgk-V3U.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_CDtVOUQR.mjs';
import { $ as $$Main } from '../chunks/Main_CUjI6Xck.mjs';
import { g as getSession } from '../chunks/server_CURo6mGD.mjs';
export { renderers } from '../renderers.mjs';

const $$Astro = createAstro();
const prerender = false;
const $$MyAnimeList = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$MyAnimeList;
  const session = await getSession(Astro2.request);
  if (!session) return Astro2.redirect("/");
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "My Animes" }, { "default": async ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": async ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="mt-14 p-8 flex flex-col items-center justify-center"> <h1 class="text-4xl text-white font-bold">My Anime List</h1> </section> ${renderComponent($$result3, "MyAnimeList", null, { "client:only": "vue", "session": session, "client:component-hydration": "only", "client:component-path": "@/components/MyAnimeList.vue", "client:component-export": "default" })} ` })} ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/my-anime-list.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/my-anime-list.astro";
const $$url = "/my-anime-list";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$MyAnimeList,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
