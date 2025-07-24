import { supabase } from "./supabase";
import AnimeService from "@/lib/animeService";

class UserAnimeService {
  async get({ userId }) {
    const { data, error } = await supabase
      .from("users_animes")
      .select("*")
      .eq("user_id", userId);

    if (error) {
      return { ok: false, error };
    }

    const enrichedData = await Promise.all(
      data.map(async (record) => {
        const anime = await AnimeService.getById(record.anime_id);
        return {
          ...record,
          anime,
        };
      })
    );

    return { ok: true, data: enrichedData };
  }

  async getByAnimeId({ userId, animeId }) {
    const { data, error } = await supabase
      .from("users_animes")
      .select("*")
      .eq("user_id", userId)
      .eq("anime_id", animeId)
      .maybeSingle();

    if (error) {
      return { ok: false, error };
    }

    if (!data) {
      return { ok: true, data: null };
    }

    const anime = await AnimeService.getById(data.anime_id);

    return {
      ok: true,
      data: {
        ...data,
        anime,
      },
    };
  }

  async add({ userId, animeId, status = "planned" }) {
    const { data, error } = await supabase
      .from("users_animes")
      .insert([
        {
          user_id: userId,
          anime_id: animeId,
          status,
          created_at: new Date().toISOString(),
        },
      ])
      .select();

    if (error) {
      return { ok: false, error };
    }

    return { ok: true, data: data[0] };
  }

  async update({ userId, animeId, status }) {
    const { data, error } = await supabase
      .from("users_animes")
      .update({
        status,
        updated_at: new Date().toISOString(),
      })
      .eq("user_id", userId)
      .eq("anime_id", animeId)
      .select()
      .maybeSingle();

    if (error) {
      return { ok: false, error };
    }

    return { ok: true, data };
  }

  async remove({ userId, animeId }) {
    const { error } = await supabase
      .from("users_animes")
      .delete()
      .eq("user_id", userId)
      .eq("anime_id", animeId);

    if (error) {
      return { ok: false, error };
    }

    return { ok: true };
  }

  async searchStatus({ userId, animeId }) {
    const { data, error } = await supabase
      .from("users_animes")
      .select("*")
      .eq("user_id", userId)
      .eq("anime_id", animeId)
      .maybeSingle();

    if (error) {
      return { ok: false, error };
    }

    return { ok: true, exists: !!data, status: data?.status || null };
  }
}

export default new UserAnimeService();
