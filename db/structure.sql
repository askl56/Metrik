CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime, "updated_at" datetime, "name" varchar, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "role" integer);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "registered_applications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "url" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_registered_applications_on_user_id" ON "registered_applications" ("user_id");
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "registered_application_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_events_on_registered_application_id" ON "events" ("registered_application_id");
INSERT INTO schema_migrations (version) VALUES ('20150415171615');

INSERT INTO schema_migrations (version) VALUES ('20150415171617');

INSERT INTO schema_migrations (version) VALUES ('20150415171619');

INSERT INTO schema_migrations (version) VALUES ('20150415171624');

INSERT INTO schema_migrations (version) VALUES ('20150418024025');

INSERT INTO schema_migrations (version) VALUES ('20150425100351');

