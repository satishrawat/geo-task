CREATE TABLE persons (
   id serial PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL
);

INSERT INTO persons (id, first_name, last_name) VALUES (1, 'John', 'Doe');
INSERT INTO persons (id, first_name, last_name) VALUES (2, 'Jane', 'Doe');
