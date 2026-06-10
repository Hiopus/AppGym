-- ============================================================
-- AppGym — script de création de la base de données
-- À coller dans Supabase : votre projet > SQL Editor > New query
-- puis cliquer sur "Run". À exécuter UNE SEULE FOIS.
-- ============================================================

-- Table des séances (une ligne = une séance à la salle)
create table if not exists seances (
  id uuid primary key default gen_random_uuid(),
  nom text not null,                          -- ex : Push, Pull, Jambes…
  date date not null default current_date,
  note text,                                  -- note libre optionnelle
  created_at timestamptz not null default now()
);

-- Table des exercices (rattachés à une séance)
create table if not exists exercices (
  id uuid primary key default gen_random_uuid(),
  seance_id uuid not null references seances(id) on delete cascade,
  nom text not null,                          -- ex : Développé couché
  position integer not null default 0,        -- ordre dans la séance
  created_at timestamptz not null default now()
);

-- Table des séries (rattachées à un exercice)
create table if not exists series (
  id uuid primary key default gen_random_uuid(),
  exercice_id uuid not null references exercices(id) on delete cascade,
  reps integer not null default 0,            -- nombre de répétitions
  charge numeric(6,2) not null default 0,     -- charge en kg
  position integer not null default 0,        -- ordre dans l'exercice
  created_at timestamptz not null default now()
);

-- Index pour que les requêtes restent rapides
create index if not exists idx_exercices_seance on exercices(seance_id);
create index if not exists idx_series_exercice on series(exercice_id);

-- Sécurité : on active la "Row Level Security" (obligatoire chez Supabase)
-- et on autorise la clé "anon" à tout faire. C'est adapté à un usage
-- personnel : la clé n'est jamais publiée, elle reste dans VOTRE navigateur.
alter table seances enable row level security;
alter table exercices enable row level security;
alter table series enable row level security;

create policy "acces_anon_seances"   on seances   for all to anon using (true) with check (true);
create policy "acces_anon_exercices" on exercices for all to anon using (true) with check (true);
create policy "acces_anon_series"    on series    for all to anon using (true) with check (true);
