import { c as createComponent, a as createAstro, m as maybeRenderHead, b as addAttribute, r as renderSlot, d as renderTemplate } from './astro/server_Btkud6ZY.mjs';
import 'kleur/colors';
import 'clsx';

const $$Astro = createAstro();
const $$Link = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Link;
  const { href, id = "", className = "" } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<a${addAttribute(id, "id")}${addAttribute(href, "href")}${addAttribute(`${className} w-full flex justify-center items-center gap-2 bg-white hover:bg-zinc-200 text-black text-base font-semibold px-6 py-3 rounded-xl cursor-pointer select-none`, "class")} data-astro-prefetch> ${renderSlot($$result, $$slots["default"])} </a>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Link.astro", void 0);

export { $$Link as $ };
