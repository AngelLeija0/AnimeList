import ANIMES_DATA from "@/data/animes-data.json";

class AnimeService {
  getAgeRatings() {
    return [
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
  }

  getGenders() {
    return [
      "Action",
      "Adventure",
      "Animals",
      "Anthology",
      "BL",
      "Boys' Love",
      "Business",
      "Comedy",
      "Cooking",
      "Crime",
      "Cyberpunk",
      "Dark Fantasy",
      "Demons",
      "Documentary",
      "Drama",
      "Ecchi",
      "Educational",
      "Family",
      "Fantasy",
      "Food",
      "Game",
      "Harem",
      "Historical",
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
      "Music",
      "Mystery",
      "Mythology",
      "Parody",
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
      "Space",
      "Sports",
      "Spy",
      "Steampunk",
      "Super Power",
      "Superhero",
      "Supernatural",
      "Surreal",
      "Survival",
      "Thriller",
      "Vampire",
      "Western",
      "Workplace",
      "Yaoi",
      "Yuri",
    ];
  }

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
        const ageRatingFilter = filters.age_rating.toLowerCase();
        data = data.filter(
          (anime) => (anime.age_rating || "").toLowerCase() === ageRatingFilter
        );
      }

      if (filters.genres && filters.genres.length > 0) {
        const genresFilter = filters.genres.map((g) => g.toLowerCase());
        data = data.filter((anime) => {
          const animeGenres = (anime.genres || []).map((g) => g.toLowerCase());
          return genresFilter.every((g) => animeGenres.includes(g));
        });
      }

      if (filters.has_background_image) {
        data = data.filter((anime) => anime.background_image_src);
      }
    }

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

    return data.slice(0, size);
  }

  async getById(id) {
    return ANIMES_DATA.find((anime) => anime.id === id) || null;
  }

  async search({ value, size = 25 }) {
    const query = value.trim().toLowerCase();

    const data = ANIMES_DATA.map((anime) => {
      let score = 0;

      if (anime.title.toLowerCase().includes(query)) score += 10;
      if (anime.original_title?.toLowerCase().includes(query)) score += 8;
      if (anime.overview?.toLowerCase().includes(query)) score += 3;

      return {
        ...anime,
        _score: score,
        _rate: parseFloat(anime.imdb_rate) || 0,
      };
    })
      .filter((anime) => anime._score > 0)
      .sort((a, b) => {
        if (b._score !== a._score) return b._score - a._score;
        return b._rate - a._rate;
      })
      .slice(0, size); // Aplica el page size

    return data;
  }
  
}

export default new AnimeService();
