alter table "railroad_systems"."train_schedules"
  add constraint "train_schedules_schedule_id_fkey"
  foreign key ("schedule_id")
  references "railroad_systems"."schedule"
  ("id") on update restrict on delete restrict;
