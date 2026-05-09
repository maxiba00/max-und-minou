-- ============================================================
-- Max & Minou — Supabase Setup
-- Ausführen im SQL-Editor: supabase.com → SQL Editor → New query
-- ============================================================

-- 1. Profiles (wird automatisch beim Signup befüllt)
create table public.profiles (
  id            uuid references auth.users on delete cascade primary key,
  display_name  text not null,
  invite_code   text unique not null default upper(substr(md5(gen_random_uuid()::text), 1, 6)),
  partner_id    uuid references public.profiles(id) on delete set null,
  created_at    timestamptz default now()
);

alter table public.profiles enable row level security;

create policy "own profile lesen"    on public.profiles for select using (auth.uid() = id);
create policy "partner profile lesen" on public.profiles for select using (
  id = (select partner_id from public.profiles where id = auth.uid())
);
create policy "eigenes profil einfügen" on public.profiles for insert with check (auth.uid() = id);
create policy "eigenes profil updaten"  on public.profiles for update using (auth.uid() = id);


-- 2. Swipes
create table public.swipes (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid references public.profiles(id) on delete cascade not null,
  recipe_slug text not null,
  liked       boolean not null,
  created_at  timestamptz default now(),
  unique(user_id, recipe_slug)
);

alter table public.swipes enable row level security;

create policy "eigene swipes verwalten" on public.swipes for all using (auth.uid() = user_id);
create policy "partner swipes lesen"    on public.swipes for select using (
  user_id = (select partner_id from public.profiles where id = auth.uid())
);


-- 3. Trigger: Profil automatisch beim Signup anlegen
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, display_name)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'display_name', split_part(new.email, '@', 1))
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();


-- 4. RPC: Partner verknüpfen (beide Seiten gleichzeitig)
create or replace function public.connect_partner(p_invite_code text)
returns json
language plpgsql
security definer set search_path = public
as $$
declare
  v_partner_id uuid;
  v_my_id      uuid := auth.uid();
begin
  select id into v_partner_id
  from public.profiles
  where invite_code = upper(p_invite_code)
    and id != v_my_id;

  if v_partner_id is null then
    return json_build_object('error', 'Code nicht gefunden');
  end if;

  if exists (
    select 1 from public.profiles
    where id = v_partner_id and partner_id is not null
  ) then
    return json_build_object('error', 'Diese Person ist bereits verbunden');
  end if;

  update public.profiles set partner_id = v_partner_id where id = v_my_id;
  update public.profiles set partner_id = v_my_id     where id = v_partner_id;

  return json_build_object('success', true);
end;
$$;
