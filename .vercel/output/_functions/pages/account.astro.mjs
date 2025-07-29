import { c as createComponent, a as createAstro, e as renderComponent, f as renderScript, d as renderTemplate, m as maybeRenderHead, b as addAttribute } from '../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_Dq6VfChX.mjs';
import { $ as $$Main } from '../chunks/Main_m9IkjFmI.mjs';
import { g as getSession } from '../chunks/server_B3YYf7aq.mjs';
export { renderers } from '../renderers.mjs';

const $$Astro = createAstro();
const prerender = false;
const $$Account = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Account;
  const session = await getSession(Astro2.request);
  if (!session) return Astro2.redirect("/");
  const { name, email, image } = session.user;
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Search" }, { "default": async ($$result2) => renderTemplate` ${renderComponent($$result2, "Main", $$Main, {}, { "default": async ($$result3) => renderTemplate` ${maybeRenderHead()}<section class="mt-14 p-8 flex flex-col items-center justify-center max-w-100 mx-auto"> <h1 class="text-4xl text-white font-bold mb-12">Account</h1> <img${addAttribute(image, "src")}${addAttribute(`Profile picture of ${name}`, "alt")} class="w-24 h-24 rounded-full mb-4"> <h2 class="text-zinc-100 mb-2 font-semibold text-2xl">${name}</h2> <p class="text-zinc-300 mb-4 font-medium">${email}</p> <button id="logout-button" class="w-full bg-white text-black font-medium px-4 py-2 rounded-xl cursor-pointer hover:bg-zinc-200">Logout</button> </section> ` })} ` })} ${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/account.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/account.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/account.astro";
const $$url = "/account";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Account,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
