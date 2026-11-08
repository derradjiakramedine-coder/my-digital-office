-- My Digital Office v0.3 — Supabase schema
-- Run in Supabase Dashboard > SQL Editor > New query.
-- Each authenticated user can access only their own workspace row.

create table if not exists public.mdo_workspace (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{"tasks":[],"projects":[],"documents":[],"notes":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.mdo_workspace enable row level security;

drop policy if exists "Users can read own workspace" on public.mdo_workspace;
create policy "Users can read own workspace"
on public.mdo_workspace for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert own workspace" on public.mdo_workspace;
create policy "Users can insert own workspace"
on public.mdo_workspace for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own workspace" on public.mdo_workspace;
create policy "Users can update own workspace"
on public.mdo_workspace for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- No public/anonymous access policy is created.
