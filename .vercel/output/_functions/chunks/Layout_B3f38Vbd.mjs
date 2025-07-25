import { c as createComponent, a as createAstro, m as maybeRenderHead, b as addAttribute, e as renderComponent, f as renderScript, d as renderTemplate, h as renderHead, r as renderSlot } from './astro/server_Btkud6ZY.mjs';
import 'kleur/colors';
/* empty css                           */
import $$AccountButton from './AccountButton_BgGY43Uy.mjs';
import $$MyAnimesButton from './MyAnimesButton_DqvOUL4E.mjs';
/* empty css                         */
import 'clsx';

const $$Astro$2 = createAstro();
const $$Navbar = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$2, $$props, $$slots);
  Astro2.self = $$Navbar;
  const { hide = false } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<header${addAttribute(`${hide ? "hidden" : ""} fixed top-0 -left-0 w-full z-100 px-4 sm:px-8 pt-2`, "class")}> <div id="navbar-container" class="bg-transparent rounded-lg flex items-center justify-between px-4 py-2"> <div class="flex items-center gap-8"> <a href="/" class="text-white text-xl font-semibold">AnimeList</a> <div class="flex gap-1 items-center relative" id="nav-links"> <div class="marker absolute bg-white/40 rounded-xl z-[-1]"></div> <a href="/" class="nav-link px-4 py-2 text-sm text-white font-medium rounded-xl">Home</a> <a href="/animes" class="nav-link px-4 py-2 text-sm text-white font-medium rounded-xl">Explore</a> <a href="/animes?category=recents" class="nav-link px-4 py-2 text-sm text-white font-medium rounded-xl">Recents</a> <a href="/animes?category=populars" class="nav-link px-4 py-2 text-sm text-white font-medium rounded-xl">Populars</a> <a href="/categories" class="nav-link px-4 py-2 text-sm text-white font-medium rounded-xl">Categories</a> </div> </div> <div class="flex gap-2 items-center"> ${renderComponent($$result, "MyAnimesButton", $$MyAnimesButton, { "server:defer": true, "server:component-directive": "defer", "server:component-path": "@/components/MyAnimesButton.astro", "server:component-export": "default" })} <a href="/search" class="flex items-center justify-center p-2.5 text-white hover:bg-white/40 rounded-lg cursor-pointer transition-colors"> <svg class="size-4" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0"></path><path d="M21 21l-6 -6"></path></svg> </a> ${renderComponent($$result, "AccountButton", $$AccountButton, { "server:defer": true, "server:component-directive": "defer", "server:component-path": "@/components/AccountButton.astro", "server:component-export": "default" })} </div> </div> </header> ${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Navbar.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Navbar.astro", "self");

const $$Astro$1 = createAstro();
const $$ClientRouter = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$1, $$props, $$slots);
  Astro2.self = $$ClientRouter;
  const { fallback = "animate" } = Astro2.props;
  return renderTemplate`<meta name="astro-view-transitions-enabled" content="true"><meta name="astro-view-transitions-fallback"${addAttribute(fallback, "content")}>${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/node_modules/astro/components/ClientRouter.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/node_modules/astro/components/ClientRouter.astro", void 0);

const $$Astro = createAstro();
const $$Layout = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Layout;
  const {
    title = "",
    description = "",
    image = "",
    hideNavbar = false
  } = Astro2.props;
  return renderTemplate`<html lang="en"> <head><meta charset="UTF-8"><meta name="viewport" content="width=device-width"><meta name="description"${addAttribute(description || "Browse a vast list of anime, discover detailed information, ratings, and more.", "content")}><meta property="og:image"${addAttribute(image || "/og-image.png", "content")}><meta name="keywords" content="anime, anime list, anime database, AnimeList, manga, Japanese series"><meta name="author" content="AnimeList Team"><link rel="icon" type="image/svg+xml" href="/favicon.svg"><title>${title} - AnimeList</title>${renderComponent($$result, "ClientRouter", $$ClientRouter, {})}${renderHead()}</head> <body class="w-full h-full bg-black text-white"> ${renderComponent($$result, "Toast", null, { "client:only": "vue", "client:component-hydration": "only", "client:component-path": "@/components/Toast.vue", "client:component-export": "default" })} ${!hideNavbar ? renderTemplate`${renderComponent($$result, "Navbar", $$Navbar, {})}` : null} ${renderSlot($$result, $$slots["default"])} </body></html>`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/layouts/Layout.astro", void 0);

export { $$Layout as $ };
