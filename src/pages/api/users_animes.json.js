import { getSession } from "auth-astro/server";
import UserAnimeService from "@/lib/userAnimeService";

export async function GET({ params, request, redirect }) {
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
    const { data, ok } = await UserAnimeService.getByAnimeId({
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

  const { data, ok } = await UserAnimeService.get({
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

export async function POST({ request }) {
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

  const { ok, data, error } = await UserAnimeService.add({
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

export async function PATCH({ request }) {
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

  const { ok, data, error } = await UserAnimeService.update({
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

export async function DELETE({ request }) {
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

  const { ok, error } = await UserAnimeService.remove({
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
