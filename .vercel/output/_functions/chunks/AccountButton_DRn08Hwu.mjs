import { c as createComponent, a as createAstro, m as maybeRenderHead, b as addAttribute, d as renderTemplate } from './astro/server_Dkgk-V3U.mjs';
import 'kleur/colors';
import 'clsx';
import { g as getSession } from './server_CURo6mGD.mjs';

const $$Astro = createAstro();
const $$AccountButton = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$AccountButton;
  const session = await getSession(Astro2.request);
  return renderTemplate`${maybeRenderHead()}<a${addAttribute(session ? "/account" : "/login", "href")} class="flex items-center justify-center p-2.5 text-white hover:bg-white/40 rounded-lg cursor-pointer transition-colors"> <svg class="size-4.5" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path></svg> </a>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/AccountButton.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/AccountButton.astro";
const $$url = undefined;

export { $$AccountButton as default, $$file as file, $$url as url };
