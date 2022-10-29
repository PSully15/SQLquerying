DROP DATABASE IF EXISTS  products_db;
CREATE DATABASE products_db;
\c products_db

CREATE TABLE products 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price FLOAT CHECK (price > 0),
  can_be_returned BOOLEAN NOT NULL
);

INSERT INTO products
(
  name,
  price,
  can_be_returned
)
VALUES
(
  'chair',
  44.00,
  FALSE
),
(
  'stool',
  25.99,
  TRUE
),
(
  'table',
  124.00,
  FALSE
),
(
  'coasters',
  14.99,
  TRUE
);