import { defineConfig, envField } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import vercel from '@astrojs/vercel';
import auth from 'auth-astro';

import vue from "@astrojs/vue";

export default defineConfig({
  output: "server",
  vite: {
    plugins: [tailwindcss()]
  },
  adapter: vercel({
    imageService: true,
    webAnalytics: {
      enabled: true,
    }
  }),
  integrations: [auth(), vue()],
  env: {
      schema: {
        AUTH_GOOGLE_ID: envField.string({ context: "server", access: "secret" }),
        AUTH_GOOGLE_SECRET: envField.string({ context: "server", access: "secret" }),
        SUPABASE_URL: envField.string({ context: "server", access: "secret" }),
        SUPABASE_KEY: envField.string({ context: "server", access: "secret" })
      }
    }
});