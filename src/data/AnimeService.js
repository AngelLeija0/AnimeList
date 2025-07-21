import ANIMES_DATA from "@/data/animes-data.json";

class AnimeService {
  static AGE_RATINGS = [
    "G",
    "PG",
    "PG-13",
    "R",
    "R - 17+",
    "R+",
    "R+ (17+)",
    "R-17+",
    "R-17+ (violence & profanity)",
    "R-18",
    "TV-14",
    "TV-PG",
  ];

  static GENRES = [
    "Acción",
    "Action",
    "Adventure",
    "Animals",
    "Anthology",
    "Aventura",
    "BL",
    "Boys' Love",
    "Business",
    "Comedia",
    "Comedy",
    "Cooking",
    "Crime",
    "Cyberpunk",
    "Dark Fantasy",
    "Demons",
    "Deporte",
    "Documentary",
    "Drama",
    "Ecchi",
    "Educational",
    "Family",
    "Fantasia",
    "Fantasy",
    "Food",
    "Game",
    "Harem",
    "Historical",
    "Histórico",
    "Horror",
    "Idol",
    "Isekai",
    "Josei",
    "Kids",
    "Magic",
    "Magical Girl",
    "Martial Arts",
    "Mecha",
    "Medical",
    "Military",
    "Misterio",
    "Music",
    "Mystery",
    "Mythology",
    "Parody",
    "Piratas",
    "Police",
    "Political",
    "Prison",
    "Psychological",
    "Romance",
    "Samurai",
    "School",
    "Sci-Fi",
    "Seinen",
    "Short",
    "Shoujo",
    "Shoujo Ai",
    "Shounen",
    "Shounen Ai",
    "Shōnen",
    "Slice of Life",
    "Sobrenatural",
    "Space",
    "Sports",
    "Spy",
    "Steampunk",
    "Super Power",
    "Superhero",
    "Superhéroes",
    "Supernatural",
    "Superpoderes",
    "Surreal",
    "Survival",
    "Thriller",
    "Vampire",
    "Western",
    "Workplace",
    "Yaoi",
    "Yuri",
  ];

  async get({ size = 25, sortBy = "release_date:desc", filters = {} } = {}) {
    let data = [...ANIMES_DATA];

    if (filters) {
      if (filters.still_in_emision !== undefined) {
        data = data.filter(
          (anime) => anime.still_in_emision === filters.still_in_emision
        );
      }

      if (filters.history_finish !== undefined) {
        data = data.filter(
          (anime) => anime.history_finish === filters.history_finish
        );
      }

      if (filters.age_rating) {
        data = data.filter((anime) => anime.age_rating === filters.age_rating);
      }

      if (filters.genres && filters.genres.length > 0) {
        data = data.filter((anime) =>
          filters.genres.every((g) => anime.genres.includes(g))
        );
      }
    }

    // --- Ordenar ---
    if (sortBy) {
      const [key, direction] = sortBy.split(":");

      data.sort((a, b) => {
        const dir = direction === "desc" ? -1 : 1;

        if (typeof a[key] === "string") {
          return a[key].localeCompare(b[key]) * dir;
        }

        return (a[key] - b[key]) * dir;
      });
    }

    // --- Limitar tamaño ---
    return data.slice(0, size);
  }

  async getById(id) {
    return ANIMES_DATA.find((anime) => anime.id === id) || null;
  }

  async search(value) {
    const query = value.trim().toLowerCase();
    const data = ANIMES_DATA.filter(
      (anime) =>
        anime.title.toLowerCase().includes(query) ||
        anime.original_title?.toLowerCase().includes(query) ||
        anime.overview?.toLowerCase().includes(query)
    );

    return data;
  }
}

export default new AnimeService();
