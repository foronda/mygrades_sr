CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "weight" float, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "task_id" integer, "name" varchar(255), "semester" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "evals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "rating" varchar(255), "comments" text, "task_id" integer, "team_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "grades" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_id" integer, "task_id" integer, "student_id" integer, "earned" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar(255) NOT NULL, "data" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_id" integer, "team_id" integer, "username" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_id" integer, "category_id" integer, "name" varchar(255), "total" integer, "due_date" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teams" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "course_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_evals_on_task_id" ON "evals" ("task_id");
CREATE INDEX "index_evals_on_team_id" ON "evals" ("team_id");
CREATE INDEX "index_grades_on_course_id" ON "grades" ("course_id");
CREATE INDEX "index_grades_on_student_id" ON "grades" ("student_id");
CREATE INDEX "index_grades_on_task_id" ON "grades" ("task_id");
CREATE INDEX "index_sessions_on_session_id" ON "sessions" ("session_id");
CREATE INDEX "index_sessions_on_updated_at" ON "sessions" ("updated_at");
CREATE INDEX "index_students_on_course_id" ON "students" ("course_id");
CREATE INDEX "index_students_on_team_id" ON "students" ("team_id");
CREATE INDEX "index_tasks_on_course_id" ON "tasks" ("course_id");
CREATE INDEX "index_teams_on_course_id" ON "teams" ("course_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20121114111535');

INSERT INTO schema_migrations (version) VALUES ('20121114112454');

INSERT INTO schema_migrations (version) VALUES ('20121114120523');

INSERT INTO schema_migrations (version) VALUES ('20121114190359');

INSERT INTO schema_migrations (version) VALUES ('20121115051715');

INSERT INTO schema_migrations (version) VALUES ('20121115220531');

INSERT INTO schema_migrations (version) VALUES ('20121115231020');

INSERT INTO schema_migrations (version) VALUES ('20121130220040');