import { s as supabase, g as getSession } from '../../chunks/server_CltxNy3e.mjs';
import { A as AnimeService } from '../../chunks/animeService_Diipd3Ol.mjs';
export { renderers } from '../../renderers.mjs';

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

const UserAnimeService$1 = new UserAnimeService();

async function GET({ params, request, redirect }) {
  const session = await getSession(request);
  if (!session?.user?.userId) {
    return new Response(JSON.stringify({ message: "Unauthorized" }), {
      status: 401,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  const url = new URL(request.url);
  const urlParams = url.searchParams;

  const animeId = urlParams.get("animeId");

  if (animeId) {
    const { data, ok } = await UserAnimeService$1.getByAnimeId({
      userId: session.user.userId,
      animeId,
    });
    if (!ok) {
      return new Response(JSON.stringify({ message: "Internal error" }), {
        status: 500,
        headers: {
          "Content-Type": "application/json",
        },
      });
    }

    return new Response(JSON.stringify(data), {
      status: 201,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  const { data, ok } = await UserAnimeService$1.get({
    userId: session.user.userId,
  });

  if (!ok) {
    return new Response(JSON.stringify({ message: "Internal error" }), {
      status: 500,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  return new Response(JSON.stringify(data), {
    status: 201,
    headers: {
      "Content-Type": "application/json",
    },
  });
}

async function POST({ request }) {
  const session = await getSession(request);
  if (!session?.user) {
    return new Response(JSON.stringify({ message: "Unauthorized" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return new Response(JSON.stringify({ message: "Invalid JSON" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const { animeId, status = "planned" } = body;

  if (!animeId) {
    return new Response(JSON.stringify({ message: "animeId is required" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const { ok, data, error } = await UserAnimeService$1.add({
    userId: session.user.userId,
    animeId,
    status,
  });

  if (!ok) {
    return new Response(
      JSON.stringify({ message: "Failed to add anime", error }),
      {
        status: 500,
        headers: { "Content-Type": "application/json" },
      }
    );
  }

  return new Response(JSON.stringify(data), {
    status: 201,
    headers: { "Content-Type": "application/json" },
  });
}

async function PATCH({ request }) {
  const session = await getSession(request);
  if (!session?.user) {
    return new Response(JSON.stringify({ message: "Unauthorized" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return new Response(JSON.stringify({ message: "Invalid JSON" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const { animeId, status } = body;

  if (!animeId || !status) {
    return new Response(
      JSON.stringify({ message: "`animeId` and `status` are required" }),
      {
        status: 400,
        headers: { "Content-Type": "application/json" },
      }
    );
  }

  const { ok, data, error } = await UserAnimeService$1.update({
    userId: session.user.userId,
    animeId,
    status,
  });

  if (!ok) {
    return new Response(
      JSON.stringify({ message: "Failed to update status", error }),
      {
        status: 500,
        headers: { "Content-Type": "application/json" },
      }
    );
  }

  return new Response(JSON.stringify(data), {
    status: 200,
    headers: { "Content-Type": "application/json" },
  });
}

async function DELETE({ request }) {
  const session = await getSession(request);
  if (!session?.user) {
    return new Response(JSON.stringify({ message: "Unauthorized" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return new Response(JSON.stringify({ message: "Invalid JSON" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const { animeId } = body;

  if (!animeId) {
    return new Response(JSON.stringify({ message: "animeId is required" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const { ok, error } = await UserAnimeService$1.remove({
    userId: session.user.userId,
    animeId,
  });

  if (!ok) {
    return new Response(
      JSON.stringify({ message: "Failed to remove anime", error }),
      {
        status: 500,
        headers: { "Content-Type": "application/json" },
      }
    );
  }

  return new Response(
    JSON.stringify({ message: "Anime removed successfully" }),
    {
      status: 200,
      headers: { "Content-Type": "application/json" },
    }
  );
}

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  DELETE,
  GET,
  PATCH,
  POST
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
