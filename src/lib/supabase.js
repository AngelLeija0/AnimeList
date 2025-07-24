import { SUPABASE_URL, SUPABASE_KEY } from "astro:env/server";
import { createClient } from "@supabase/supabase-js";

export const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
