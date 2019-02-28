DROP DATABASE IF EXISTS super_rad;

CREATE DATABASE super_rad; 

\c super_rad; 


CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(64),
	password VARCHAR,
	-- password_digest VARCHAR(60),
	is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE images (
	id SERIAL PRIMARY KEY, 
	image_url TEXT
);

CREATE TABLE tags (
	id SERIAL PRIMARY KEY,
	image_id INTEGER REFERENCES images(id),
	image_tag VARCHAR(255)
);

