alter table "railroad_systems"."schedule"
  add constraint "schedule_time_point_id_fkey"
  foreign key ("time_point_id")
  references "railroad_systems"."time_points"
  ("id") on update restrict on delete restrict;
