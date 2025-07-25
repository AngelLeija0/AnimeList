import { c as createComponent, a as createAstro, m as maybeRenderHead, d as renderTemplate } from './astro/server_Btkud6ZY.mjs';
import 'kleur/colors';
import 'clsx';
import { g as getSession } from './server_CAuKSGxP.mjs';

const $$Astro = createAstro();
const $$MyAnimesButton = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$MyAnimesButton;
  const session = await getSession(Astro2.request);
  if (!session) return;
  return renderTemplate`${maybeRenderHead()}<a href="/my-anime-list" class="nav-link text-nowrap px-4 py-2 text-sm bg-white hover:bg-zinc-200 text-black font-medium rounded-xl">My Anime List</a>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/MyAnimesButton.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/MyAnimesButton.astro";
const $$url = undefined;

export { $$MyAnimesButton as default, $$file as file, $$url as url };
