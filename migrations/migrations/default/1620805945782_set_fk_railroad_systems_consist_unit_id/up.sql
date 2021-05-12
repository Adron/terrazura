alter table "railroad_systems"."consist"
  add constraint "consist_unit_id_fkey"
  foreign key ("unit_id")
  references "railroad_systems"."units"
  ("id") on update restrict on delete restrict;
