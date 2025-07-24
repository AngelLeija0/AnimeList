import { supabase } from "@/lib/supabase";

class AuthService {
  async login(user) {
    try {
      const { data, error } = await supabase
        .from("users")
        .select("*")
        .eq("email", user.email)
        .single();

      if (error && error.code !== "PGRST116") {
        return { ok: false, error: error.message };
      }

      if (data) {
        return { ok: true, user: data };
      }

      const { data: newUser, error: insertError } = await supabase
        .from("users")
        .insert([user])
        .select()
        .single();

      if (insertError) {
        return { ok: false, error: insertError.message };
      }

      return { ok: true, user: newUser };

    } catch (err) {
      return { ok: false, error: err.message };
    }
  }
}

export default new AuthService();
