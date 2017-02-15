
CREATE DATABASE all_the_cheese;
\c all_the_cheese

CREATE TABLE chesses (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	year INTEGER
);