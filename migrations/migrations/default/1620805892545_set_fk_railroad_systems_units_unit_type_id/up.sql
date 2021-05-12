alter table "railroad_systems"."units"
  add constraint "units_unit_type_id_fkey"
  foreign key ("unit_type_id")
  references "railroad_systems"."unit_type"
  ("id") on update restrict on delete restrict;
