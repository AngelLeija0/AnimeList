import 'kleur/colors';
import { f as decodeKey } from './chunks/astro/server_CGjrCeKM.mjs';
import 'clsx';
import 'cookie';
import { N as NOOP_MIDDLEWARE_FN } from './chunks/astro-designed-error-pages_By_44-8A.mjs';
import 'es-module-lexer';

function sanitizeParams(params) {
  return Object.fromEntries(
    Object.entries(params).map(([key, value]) => {
      if (typeof value === "string") {
        return [key, value.normalize().replace(/#/g, "%23").replace(/\?/g, "%3F")];
      }
      return [key, value];
    })
  );
}
function getParameter(part, params) {
  if (part.spread) {
    return params[part.content.slice(3)] || "";
  }
  if (part.dynamic) {
    if (!params[part.content]) {
      throw new TypeError(`Missing parameter: ${part.content}`);
    }
    return params[part.content];
  }
  return part.content.normalize().replace(/\?/g, "%3F").replace(/#/g, "%23").replace(/%5B/g, "[").replace(/%5D/g, "]");
}
function getSegment(segment, params) {
  const segmentPath = segment.map((part) => getParameter(part, params)).join("");
  return segmentPath ? "/" + segmentPath : "";
}
function getRouteGenerator(segments, addTrailingSlash) {
  return (params) => {
    const sanitizedParams = sanitizeParams(params);
    let trailing = "";
    if (addTrailingSlash === "always" && segments.length) {
      trailing = "/";
    }
    const path = segments.map((segment) => getSegment(segment, sanitizedParams)).join("") + trailing;
    return path || "/";
  };
}

function deserializeRouteData(rawRouteData) {
  return {
    route: rawRouteData.route,
    type: rawRouteData.type,
    pattern: new RegExp(rawRouteData.pattern),
    params: rawRouteData.params,
    component: rawRouteData.component,
    generate: getRouteGenerator(rawRouteData.segments, rawRouteData._meta.trailingSlash),
    pathname: rawRouteData.pathname || void 0,
    segments: rawRouteData.segments,
    prerender: rawRouteData.prerender,
    redirect: rawRouteData.redirect,
    redirectRoute: rawRouteData.redirectRoute ? deserializeRouteData(rawRouteData.redirectRoute) : void 0,
    fallbackRoutes: rawRouteData.fallbackRoutes.map((fallback) => {
      return deserializeRouteData(fallback);
    }),
    isIndex: rawRouteData.isIndex,
    origin: rawRouteData.origin
  };
}

function deserializeManifest(serializedManifest) {
  const routes = [];
  for (const serializedRoute of serializedManifest.routes) {
    routes.push({
      ...serializedRoute,
      routeData: deserializeRouteData(serializedRoute.routeData)
    });
    const route = serializedRoute;
    route.routeData = deserializeRouteData(serializedRoute.routeData);
  }
  const assets = new Set(serializedManifest.assets);
  const componentMetadata = new Map(serializedManifest.componentMetadata);
  const inlinedScripts = new Map(serializedManifest.inlinedScripts);
  const clientDirectives = new Map(serializedManifest.clientDirectives);
  const serverIslandNameMap = new Map(serializedManifest.serverIslandNameMap);
  const key = decodeKey(serializedManifest.key);
  return {
    // in case user middleware exists, this no-op middleware will be reassigned (see plugin-ssr.ts)
    middleware() {
      return { onRequest: NOOP_MIDDLEWARE_FN };
    },
    ...serializedManifest,
    assets,
    componentMetadata,
    inlinedScripts,
    clientDirectives,
    routes,
    serverIslandNameMap,
    key
  };
}

const manifest = deserializeManifest({"hrefRoot":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/","cacheDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/node_modules/.astro/","outDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/dist/","srcDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/src/","publicDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/public/","buildClientDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/dist/client/","buildServerDir":"file:///C:/Users/angel/Documents/04%20Projects%20VSCode/05%20Animes/anime-list-app/dist/server/","adapterName":"@astrojs/vercel","routes":[{"file":"","links":[],"scripts":[],"styles":[],"routeData":{"type":"page","component":"_server-islands.astro","params":["name"],"segments":[[{"content":"_server-islands","dynamic":false,"spread":false}],[{"content":"name","dynamic":true,"spread":false}]],"pattern":"^\\/_server-islands\\/([^/]+?)\\/?$","prerender":false,"isIndex":false,"fallbackRoutes":[],"route":"/_server-islands/[name]","origin":"internal","_meta":{"trailingSlash":"ignore"}}},{"file":"index.html","links":[],"scripts":[],"styles":[],"routeData":{"route":"/","isIndex":true,"type":"page","pattern":"^\\/$","segments":[],"params":[],"component":"src/pages/index.astro","pathname":"/","prerender":true,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[],"routeData":{"type":"endpoint","isIndex":false,"route":"/_image","pattern":"^\\/_image\\/?$","segments":[[{"content":"_image","dynamic":false,"spread":false}]],"params":[],"component":"node_modules/astro/dist/assets/endpoint/generic.js","pathname":"/_image","prerender":false,"fallbackRoutes":[],"origin":"internal","_meta":{"trailingSlash":"ignore"}}}],"base":"/","trailingSlash":"ignore","compressHTML":true,"componentMetadata":[["C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/animes/[id].astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/animes/[id]@_@astro",{"propagation":"in-tree","containsHead":false}],["\u0000@astrojs-ssr-virtual-entry",{"propagation":"in-tree","containsHead":false}],["C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Animes.astro",{"propagation":"in-tree","containsHead":false}],["C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/pages/index.astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/index@_@astro",{"propagation":"in-tree","containsHead":false}]],"renderers":[],"clientDirectives":[["idle","(()=>{var l=(n,t)=>{let i=async()=>{await(await n())()},e=typeof t.value==\"object\"?t.value:void 0,s={timeout:e==null?void 0:e.timeout};\"requestIdleCallback\"in window?window.requestIdleCallback(i,s):setTimeout(i,s.timeout||200)};(self.Astro||(self.Astro={})).idle=l;window.dispatchEvent(new Event(\"astro:idle\"));})();"],["load","(()=>{var e=async t=>{await(await t())()};(self.Astro||(self.Astro={})).load=e;window.dispatchEvent(new Event(\"astro:load\"));})();"],["media","(()=>{var n=(a,t)=>{let i=async()=>{await(await a())()};if(t.value){let e=matchMedia(t.value);e.matches?i():e.addEventListener(\"change\",i,{once:!0})}};(self.Astro||(self.Astro={})).media=n;window.dispatchEvent(new Event(\"astro:media\"));})();"],["only","(()=>{var e=async t=>{await(await t())()};(self.Astro||(self.Astro={})).only=e;window.dispatchEvent(new Event(\"astro:only\"));})();"],["visible","(()=>{var a=(s,i,o)=>{let r=async()=>{await(await s())()},t=typeof i.value==\"object\"?i.value:void 0,c={rootMargin:t==null?void 0:t.rootMargin},n=new IntersectionObserver(e=>{for(let l of e)if(l.isIntersecting){n.disconnect(),r();break}},c);for(let e of o.children)n.observe(e)};(self.Astro||(self.Astro={})).visible=a;window.dispatchEvent(new Event(\"astro:visible\"));})();"]],"entryModules":{"\u0000@astrojs-ssr-adapter":"_@astrojs-ssr-adapter.mjs","\u0000noop-middleware":"_noop-middleware.mjs","\u0000noop-actions":"_noop-actions.mjs","\u0000@astro-renderers":"renderers.mjs","\u0000@astro-page:src/pages/animes/[id]@_@astro":"pages/animes/_id_.astro.mjs","\u0000@astrojs-ssr-virtual-entry":"entry.mjs","\u0000@astro-page:src/pages/index@_@astro":"pages/index.astro.mjs","\u0000@astro-page:node_modules/astro/dist/assets/endpoint/generic@_@js":"pages/_image.astro.mjs","C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/node_modules/astro/dist/assets/services/sharp.js":"chunks/sharp_DfGwQuqE.mjs","\u0000@astrojs-manifest":"manifest_3j9mro3d.mjs","C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Hero.astro?astro&type=script&index=0&lang.ts":"_astro/Hero.astro_astro_type_script_index_0_lang.CRL6C-cP.js","C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Navbar.astro?astro&type=script&index=0&lang.ts":"_astro/Navbar.astro_astro_type_script_index_0_lang.BWufQ60p.js","C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/node_modules/astro/components/ClientRouter.astro?astro&type=script&index=0&lang.ts":"_astro/ClientRouter.astro_astro_type_script_index_0_lang.D98dxaWf.js","astro:scripts/before-hydration.js":""},"inlinedScripts":[["C:/Users/angel/Documents/04 Projects VSCode/05 Animes/anime-list-app/src/components/Navbar.astro?astro&type=script&index=0&lang.ts","document.addEventListener(\"astro:page-load\",()=>{const c=localStorage.getItem(\"theme\"),d=window.matchMedia(\"(prefers-color-scheme: dark)\").matches,r=c??(d?\"dark\":\"light\");document.documentElement.setAttribute(\"data-theme\",r);const t=document.querySelector(\"#theme-button\");t&&t.addEventListener(\"click\",()=>{const n=(document.documentElement.getAttribute(\"data-theme\")||\"light\")===\"dark\"?\"light\":\"dark\";document.documentElement.setAttribute(\"data-theme\",n),localStorage.setItem(\"theme\",n)});const e=document.querySelector(\"#to-top-button\");e&&(window.addEventListener(\"scroll\",()=>{window.scrollY>800?e.classList.remove(\"hidden\"):e.classList.add(\"hidden\")}),e.addEventListener(\"click\",()=>{window.scrollTo({top:0,behavior:\"smooth\"})}));const o=document.querySelector(\"#go-to-search-button\");o&&o.addEventListener(\"click\",()=>{window.scrollTo({top:0,behavior:\"smooth\"})})});"]],"assets":["/_astro/_id_.noBk1RJQ.css","/favicon.svg","/_astro/ClientRouter.astro_astro_type_script_index_0_lang.D98dxaWf.js","/_astro/Hero.astro_astro_type_script_index_0_lang.CRL6C-cP.js","/index.html"],"buildFormat":"directory","checkOrigin":true,"serverIslandNameMap":[],"key":"Zf4VtW7E+xz9gcBvgLiZZxN3J6hsdDxiFW/W7JWB3uY="});
if (manifest.sessionConfig) manifest.sessionConfig.driverModule = null;

export { manifest };
