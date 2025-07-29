import { c as createComponent, m as maybeRenderHead, f as renderScript, d as renderTemplate, a as createAstro, e as renderComponent } from '../chunks/astro/server_m2jZuNF-.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Layout_Dq6VfChX.mjs';
import 'clsx';
import { g as getSession } from '../chunks/server_B3YYf7aq.mjs';
export { renderers } from '../renderers.mjs';

const $$GoogleButton = createComponent(async ($$result, $$props, $$slots) => {
  return renderTemplate`${maybeRenderHead()}<button id="login-google-button" class="flex justify-center gap-4 items-center w-full bg-[#0a0a0a] border hover:bg-zinc-900 border-zinc-700 rounded-xl px-8 py-3.5 text-base font-semibold text-zinc-200 cursor-pointer transition-colo"> <svg class="size-5" viewBox="-0.5 0 48 48" version="1.1"> <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g transform="translate(-401.000000, -860.000000)"> <g transform="translate(401.000000, 860.000000)"> <path d="M9.82727273,24 C9.82727273,22.4757333 10.0804318,21.0144 10.5322727,19.6437333 L2.62345455,13.6042667 C1.08206818,16.7338667 0.213636364,20.2602667 0.213636364,24 C0.213636364,27.7365333 1.081,31.2608 2.62025,34.3882667 L10.5247955,28.3370667 C10.0772273,26.9728 9.82727273,25.5168 9.82727273,24" fill="#FBBC05"></path> <path d="M23.7136364,10.1333333 C27.025,10.1333333 30.0159091,11.3066667 32.3659091,13.2266667 L39.2022727,6.4 C35.0363636,2.77333333 29.6954545,0.533333333 23.7136364,0.533333333 C14.4268636,0.533333333 6.44540909,5.84426667 2.62345455,13.6042667 L10.5322727,19.6437333 C12.3545909,14.112 17.5491591,10.1333333 23.7136364,10.1333333" fill="#EB4335"></path> <path d="M23.7136364,37.8666667 C17.5491591,37.8666667 12.3545909,33.888 10.5322727,28.3562667 L2.62345455,34.3946667 C6.44540909,42.1557333 14.4268636,47.4666667 23.7136364,47.4666667 C29.4455,47.4666667 34.9177955,45.4314667 39.0249545,41.6181333 L31.5177727,35.8144 C29.3995682,37.1488 26.7323182,37.8666667 23.7136364,37.8666667" fill="#34A853"></path> <path d="M46.1454545,24 C46.1454545,22.6133333 45.9318182,21.12 45.6113636,19.7333333 L23.7136364,19.7333333 L23.7136364,28.8 L36.3181818,28.8 C35.6879545,31.8912 33.9724545,34.2677333 31.5177727,35.8144 L39.0249545,41.6181333 C43.3393409,37.6138667 46.1454545,31.6490667 46.1454545,24" fill="#4285F4"></path> </g> </g> </g> </svg> <span>Continue with Google</span> </button> ${renderScript($$result, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/GoogleButton.astro?astro&type=script&index=0&lang.ts")}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/GoogleButton.astro", void 0);

const $$Astro = createAstro();
const prerender = false;
const $$Login = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Login;
  const session = await getSession(Astro2.request);
  if (session?.user) return Astro2.redirect("/");
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": "Login", "hideNavbar": "true" }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<header class="fixed top-0 left-0 w-full p-4 flex justify-between gap-2 items-center z-10"> <a href="/" class="text-white text-xl font-semibold">AnimeList</a> <a href="/" class="flex items-center justify-center p-2.5 text-white hover:bg-white/40 rounded-lg cursor-pointer transition-colors"> <svg class="size-4.5" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path></svg> </a> </header> <main class="w-screen min-h-screen relative flex items-center justify-center px-4 sm:px-6"> <section class="flex flex-col items-center shadow-2xl backdrop-blur-md max-w-100"> <h1 class="text-[1.9rem] font-bold text-zinc-200 mb-8">Login</h1> ${renderComponent($$result2, "GoogleButton", $$GoogleButton, {})} </section> </main> ` })}`;
}, "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/login.astro", void 0);

const $$file = "C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/login.astro";
const $$url = "/login";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Login,
  file: $$file,
  prerender,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
