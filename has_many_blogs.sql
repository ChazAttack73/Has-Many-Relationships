DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;

CREATE DATABASE has_many_blogs;

\c has_many_blogs;

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  "id" serial NOT NULL,
  PRIMARY KEY ( "id" ),
  "username" varchar( 90 ) NOT NULL,
  "first_name" varchar( 90 ) DEFAULT NULL,
  "last_name" varchar( 90 ) DEFAULT NULL,
  "created_at" timestamp with time zone NOT NULL DEFAULT now(),
  "updated_at" timestamp with time zone NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts
(
  "id" serial NOT NULL,
  PRIMARY KEY ( "id" ),
  "title" varchar( 180 ) DEFAULT NULL,
  "url" varchar( 510 ) DEFAULT NULL,
  "content" text DEFAULT NULL,
  "created_at" timestamp with time zone NOT NULL DEFAULT now(),
  "updated_at" timestamp with time zone NOT NULL DEFAULT now(),
  "user_id" serial NOT NULL REFERENCES users MATCH FULL
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments
(
  "id" serial NOT NULL REFERENCES users,
  PRIMARY KEY ( "id" ),
  "body" varchar( 510 ) DEFAULT NULL,
  "created_at" timestamp with time zone NOT NULL DEFAULT now(),
  "updated_at" timestamp with time zone NOT NULL DEFAULT now(),
  "user_id" serial NOT NULL REFERENCES users MATCH FULL,
  "post_id" serial NOT NULL REFERENCES posts MATCH FULL
);

\i scripts/blog_data.sql;