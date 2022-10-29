-- 1. Display all of the rows and columns in the table.
SELECT *
FROM products;

-- 2. Display all of the names of the products.
SELECT name, price
FROM products;

-- 3. Display only the products that can_be_returned.
SELECT *
FROM products
WHERE can_be_returned = TRUE;

-- 4. Display only the products that have a price less than 44.00.
SELECT *
FROM products
WHERE price < 44.00;

-- 5. Display only the products that have a price in between 22.50 and 99.99.
SELECT *
FROM products
WHERE price
BETWEEN 22.50 AND 99.99;

-- 6. There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products
SET price = price - 20
WHERE price >= 20;

-- 7. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
DELETE FROM products
WHERE price < 25;

-- 8. And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products
SET price = price + 20;

-- 9. There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products 
SET can_be_returned = 't';