alter table "public"."missions" add column "created_at" timestamptz
 null default now();
