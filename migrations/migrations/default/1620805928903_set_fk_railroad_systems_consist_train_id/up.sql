alter table "railroad_systems"."consist"
  add constraint "consist_train_id_fkey"
  foreign key ("train_id")
  references "railroad_systems"."trains"
  ("id") on update restrict on delete restrict;
