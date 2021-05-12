alter table "railroad_systems"."train_schedules"
  add constraint "train_schedules_train_id_fkey"
  foreign key ("train_id")
  references "railroad_systems"."trains"
  ("id") on update restrict on delete restrict;
