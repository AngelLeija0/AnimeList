import { renderers } from './renderers.mjs';
import { c as createExports } from './chunks/entrypoint_CyBEKpqQ.mjs';
import { manifest } from './manifest_DiB2dos9.mjs';

const serverIslandMap = new Map();;

const _page0 = () => import('./pages/_image.astro.mjs');
const _page1 = () => import('./pages/account.astro.mjs');
const _page2 = () => import('./pages/animes/_id_.astro.mjs');
const _page3 = () => import('./pages/animes.astro.mjs');
const _page4 = () => import('./pages/api/auth/_---auth_.astro.mjs');
const _page5 = () => import('./pages/api/users_animes.json.astro.mjs');
const _page6 = () => import('./pages/categories.astro.mjs');
const _page7 = () => import('./pages/login.astro.mjs');
const _page8 = () => import('./pages/my-anime-list.astro.mjs');
const _page9 = () => import('./pages/search.astro.mjs');
const _page10 = () => import('./pages/index.astro.mjs');
const pageMap = new Map([
    ["node_modules/astro/dist/assets/endpoint/generic.js", _page0],
    ["src/pages/account.astro", _page1],
    ["src/pages/animes/[id].astro", _page2],
    ["src/pages/animes.astro", _page3],
    ["node_modules/auth-astro/src/api/[...auth].ts", _page4],
    ["src/pages/api/users_animes.json.js", _page5],
    ["src/pages/categories.astro", _page6],
    ["src/pages/login.astro", _page7],
    ["src/pages/my-anime-list.astro", _page8],
    ["src/pages/search.astro", _page9],
    ["src/pages/index.astro", _page10]
]);

const _manifest = Object.assign(manifest, {
    pageMap,
    serverIslandMap,
    renderers,
    actions: () => import('./_noop-actions.mjs'),
    middleware: () => import('./_noop-middleware.mjs')
});
const _args = {
    "middlewareSecret": "970ece85-a028-457f-910e-867fd5a4e537",
    "skewProtection": false
};
const _exports = createExports(_manifest, _args);
const __astrojsSsrVirtualEntry = _exports.default;

export { __astrojsSsrVirtualEntry as default, pageMap };
