DROP DATABASE IF EXISTS dream_logic;

CREATE DATABASE dream_logic; 

\c dream_logic; 


CREATE TABLE admins (
	id SERIAL PRIMARY KEY,
	username VARCHAR(64),
	password_digest VARCHAR(60)  
);


CREATE TABLE images (
	id SERIAL PRIMARY KEY, 
	image_url VARCHAR(255)
);

CREATE TABLE tags (
	id SERIAL PRIMARY KEY,
	image_id REFERENCES image(id),
	image_tag VARCHAR(128)
);
