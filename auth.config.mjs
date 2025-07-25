import {
  AUTH_GOOGLE_ID,
  AUTH_GOOGLE_SECRET,
} from "astro:env/server";
import { defineConfig } from "auth-astro";
import Google from "@auth/core/providers/google";
import AuthService from "@/lib/authService";

export default defineConfig({
  trustHost: true,
  providers: [
    Google({
      clientId: AUTH_GOOGLE_ID,
      clientSecret: AUTH_GOOGLE_SECRET,
      async profile(profile) {
        const { email, name, picture } = profile;

        if (!email || !name) {
          throw new Error("Incomplete profile information from provider.");
        }

        const result = await AuthService.login({
          email,
          name,
          image: picture,
        });

        if (!result.ok || !result.user) {
          console.error("AuthService.login failed:", result.error);
          throw new Error("Failed to authenticate user.");
        }

        return {
          userId: result.user.id,
          name: result.user.name,
          email: result.user.email,
          image: result.user.image,
        };
      },
    }),
  ],
  callbacks: {
    async session({ session, token }) {
      if (token) {
        session.user.userId = token.userId;
        session.user.name = token.name;
        session.user.email = token.email;
        session.user.image = token.image;
      }
      return session;
    },
    async jwt({ token, user }) {
      if (user) {
        token.userId = user.userId;
        token.name = user.name;
        token.email = user.email;
        token.image = user.image;
      }
      return token;
    },
  }
});
