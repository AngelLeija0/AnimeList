import { c as createComponent, a as createAstro, m as maybeRenderHead, b as addAttribute, r as renderSlot, d as renderTemplate } from './astro/server_Btkud6ZY.mjs';
import 'kleur/colors';
import 'clsx';

const $$Astro = createAstro();
const $$Main = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Main;
  const { className = "" } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<main${addAttribute(`w-full flex flex-col ${className}`, "class")}> ${renderSlot($$result, $$slots["default"])} </main>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Main.astro", void 0);

export { $$Main as $ };
