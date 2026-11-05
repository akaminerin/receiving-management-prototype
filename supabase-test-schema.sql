-- 入荷管理プロトタイプ用・共有データ保存テーブル
-- Supabase の SQL Editor で一度だけ実行してください。
create table if not exists public.app_state (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

drop policy if exists "prototype read" on public.app_state;
drop policy if exists "prototype insert" on public.app_state;
drop policy if exists "prototype update" on public.app_state;

create policy "prototype read" on public.app_state
for select to anon using (id = 'main');

create policy "prototype insert" on public.app_state
for insert to anon with check (id = 'main');

create policy "prototype update" on public.app_state
for update to anon using (id = 'main') with check (id = 'main');

insert into public.app_state (id, data)
values ('main', '{}'::jsonb)
on conflict (id) do nothing;

-- 注意：これは短期テスト用です。URLを知る人が同じ共有データを操作できます。
-- 本番移行時は Supabase Auth を追加し、authenticated ロール限定へ変更します。
