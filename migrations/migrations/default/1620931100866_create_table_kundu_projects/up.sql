CREATE TABLE "kundu"."projects" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "details" text, "project_profile" jsonb, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("name"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
