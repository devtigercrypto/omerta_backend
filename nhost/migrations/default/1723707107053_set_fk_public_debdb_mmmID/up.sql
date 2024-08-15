alter table "public"."debdb"
  add constraint "debdb_mmmID_fkey"
  foreign key ("mmmID")
  references "public"."mmmm"
  ("id") on update restrict on delete restrict;
