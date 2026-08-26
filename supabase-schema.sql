-- Schéma complet pour une nouvelle installation. Les quatre administrateurs
-- correspondent à la liste publique déclarée dans admin-emails.js.
create table public.players (
  id uuid primary key default gen_random_uuid(),
  name text not null unique check (char_length(name) between 1 and 24),
  active boolean not null default true,
  last_name text,
  position text not null default 'polyvalent' check (position in ('attaque','defense','polyvalent')),
  avatar_url text,
  created_at timestamptz not null default now()
);
create table public.matches (
  id uuid primary key default gen_random_uuid(),
  date date not null,
  result text not null check (result in ('A','B','N')),
  motm_id uuid not null references public.players(id),
  score_a int not null default 0 check (score_a >= 0),
  score_b int not null default 0 check (score_b >= 0),
  created_at timestamptz not null default now()
);
create table public.participations (
  match_id uuid not null references public.matches(id) on delete cascade,
  player_id uuid not null references public.players(id),
  team text not null check (team in ('A','B')),
  goals int not null default 0 check (goals >= 0),
  primary key (match_id, player_id)
);
alter table public.players enable row level security;
alter table public.matches enable row level security;
alter table public.participations enable row level security;
create policy "lecture publique joueurs" on public.players for select using (true);
create policy "lecture publique matchs" on public.matches for select using (true);
create policy "lecture publique participations" on public.participations for select using (true);
create policy "admin gere joueurs" on public.players for all to authenticated using (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com'])) with check (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com']));
create policy "admin gere matchs" on public.matches for all to authenticated using (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com'])) with check (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com']));
create policy "admin gere participations" on public.participations for all to authenticated using (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com'])) with check (lower(auth.jwt() ->> 'email') = any(array['juliencannoux@yahoo.com','juliiengravity350@gmail.com','rayanrahou51@gmail.com','lucas.nadreau@gmail.com']));
