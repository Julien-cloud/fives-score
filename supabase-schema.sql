-- Exécuter dans Supabase > SQL Editor, après avoir remplacé TON_EMAIL@EXEMPLE.COM.
create table public.players (
  id uuid primary key default gen_random_uuid(),
  name text not null unique check (char_length(name) between 1 and 24),
  active boolean not null default true,
  created_at timestamptz not null default now()
);
create table public.matches (
  id uuid primary key default gen_random_uuid(),
  date date not null,
  result text not null check (result in ('A','B','N')),
  motm_id uuid not null references public.players(id),
  created_at timestamptz not null default now()
);
create table public.participations (
  match_id uuid not null references public.matches(id) on delete cascade,
  player_id uuid not null references public.players(id),
  team text not null check (team in ('A','B')),
  primary key (match_id, player_id)
);
alter table public.players enable row level security;
alter table public.matches enable row level security;
alter table public.participations enable row level security;
create policy "lecture publique joueurs" on public.players for select using (true);
create policy "lecture publique matchs" on public.matches for select using (true);
create policy "lecture publique participations" on public.participations for select using (true);
create policy "admin gere joueurs" on public.players for all to authenticated using ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM') with check ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM');
create policy "admin gere matchs" on public.matches for all to authenticated using ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM') with check ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM');
create policy "admin gere participations" on public.participations for all to authenticated using ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM') with check ((auth.jwt() ->> 'email') = 'TON_EMAIL@EXEMPLE.COM');
