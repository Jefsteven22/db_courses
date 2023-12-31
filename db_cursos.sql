CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "levels_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "description" varchar(300) NOT NULL,
  "level_curse_id" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar(30) NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" int NOT NULL,
  "rol_id" int NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "url" varchar(300) NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "student_courses" (
  "student_id" int NOT NULL,
  "course_id" int NOT NULL
);

ALTER TABLE "student_courses" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "student_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_curse_id") REFERENCES "levels_courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

INSERT INTO categories (name)
VALUES 
('Fundamentals'),
('React.js'),
('Node.js');

INSERT INTO levels_courses (title)
VALUES 
('Beginner'),
('Intermediate'),
('Advanced');

INSERT INTO roles (name)
VALUES 
('Student'),
('Teacher'),
('Administrator');

INSERT INTO courses (title, description, level_curse_id, category_id)
VALUES 
('Start of Fundamentals', 'Basic principles of HTML5, CSS3, and JavaScript', 1, 1),
('Start of React.JS', 'Principles and fundamentals of React.JS', 2, 2),
('Start of Node.JS', 'Principles and fundamentals of Node.JS', 3, 3);

INSERT INTO users (name, email, password, age, rol_id)
VALUES 
('Steven Contreras', 'steven@mail.com','123456789', 27, 1),
('Mauricio Castellanos', 'mauricio@mail.com','123456789', 30, 2),
('Jonathan Garcia', 'jonathan@mail.com','123456789', 29, 3);

INSERT INTO courses_videos (title, url, course_id)
VALUES 

('Fundamentals class 1', 'This is a URL eg: 1', 1),
('React.JS class 1', 'This is a URL eg: 2', 2),
('Node.JS class 1', 'This is a URL eg: 3', 3);

INSERT INTO student_courses (student_id, course_id)
VALUES 
(1, 3),
(2, 2),
(3, 1);
