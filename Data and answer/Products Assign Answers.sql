-- 1. Create a new database called store_db, then run the scripts
-- in the products.sql file.

CREATE DATABASE store_db;



-- 2. Select all columns from the products table.
SELECT *
FROM products;


-- 3. Select only the name, price, and category columns from the
-- products table.
SELECT name, price, category
FROM products;


-- 4. Find all products with a price greater than $50.
SELECT *
FROM products
WHERE price > 50;


-- 5. Find all products in the Electronics category.
SELECT *
FROM products
WHERE category = 'Electronics';


-- 6. Find all products that have a rating of 4.5 or higher.
SELECT *
FROM products
WHERE rating >= 4.5;


-- 7. Find all products in the Clothing category AND with a price
-- less than $30.
SELECT *
FROM products
WHERE category = 'Clothing'
  AND price < 30;


-- 8. Find all products in the Home category OR with a stock
-- quantity greater than 100.
SELECT *
FROM products
WHERE category = 'Home'
   OR stock_quantity > 100;


-- 9. Find all products that are available AND NOT in the Toys
-- category.
SELECT *
FROM products
WHERE is_available = TRUE
  AND NOT category = 'Toys';


-- 10. Find all products with a price between $20 and $100.
SELECT *
FROM products
WHERE price BETWEEN 20 AND 100;


-- 11. List all products sorted by price in ascending order.
SELECT *
FROM products
ORDER BY price ASC;


-- 12. List all products sorted by name alphabetically.
SELECT *
FROM products
ORDER BY name ASC;


-- 13. List all products sorted by rating in descending order,
-- then by price in ascending order when ratings are equal.
SELECT *
FROM products
ORDER BY rating DESC, price ASC;


-- 14. List the 5 most expensive products.
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;


-- 15. List the 10 products with the highest stock quantity.
SELECT *
FROM products
ORDER BY stock_quantity DESC
LIMIT 10;


-- 16. Display products sorted alphabetically by name, showing
-- results 6-10.
SELECT *
FROM products
ORDER BY name ASC
LIMIT 5 OFFSET 5;


-- 17. Find all products whose name contains the word Premium.
SELECT *
FROM products
WHERE name LIKE '%Premium%';


-- 18. Find all products whose name starts with the letter S.
SELECT *
FROM products
WHERE name LIKE 'S%';


-- 19. Find all products whose name ends with "er".
SELECT *
FROM products
WHERE name LIKE '%er';


-- 20. Find all products whose description contains the word "with".
SELECT *
FROM products
WHERE description LIKE '%with%';


-- 21. Find all products whose category contains "on" (case-insensitive).
SELECT *
FROM products
WHERE category ILIKE '%on%';


-- 22. Find all products whose name is exactly 5 characters long.
SELECT *
FROM products
WHERE LENGTH(name) = 5;


-- 23. Find all products released in 2023.
SELECT *
FROM products
WHERE EXTRACT(YEAR FROM release_date) = 2023;


-- 24. Find all products that have no rating.
SELECT *
FROM products
WHERE rating IS NULL;


-- 25. Find the 3 most recently released products that are still
-- available.
SELECT *
FROM products
WHERE is_available = TRUE
ORDER BY release_date DESC
LIMIT 3;


-- 26. Find all products in either the Books or Stationery category
-- with a price less than $25.
SELECT *
FROM products
WHERE (category = 'Books' OR category = 'Stationery')
  AND price < 25;


-- 27. Display product names alongside their lengths.
SELECT name, LENGTH(name) AS name_length
FROM products;


-- 28. Display all product names in uppercase.
SELECT UPPER(name) AS name_upper
FROM products;


-- 29. Extract the first 10 characters of each product description.
SELECT description, LEFT(description, 10) AS description_excerpt
FROM products;


-- 30. Replace "Premium" with "Luxury" in all product names.
SELECT name, REPLACE(name, 'Premium', 'Luxury') AS updated_name
FROM products;


-- 31. Concatenate the product name and category with a hyphen in
-- between.
SELECT CONCAT(name, ' - ', category) AS name_category
FROM products;


-- 32. Round all product prices to the nearest integer.
SELECT name, price, ROUND(price) AS rounded_price
FROM products;


-- 33. Calculate the sale price of each product after a 15%
-- discount.
SELECT name, price, ROUND(price * 0.85, 2) AS sale_price
FROM products;


-- 34. Display the day of the week (name) when each product was
-- released.
SELECT name, release_date, TO_CHAR(release_date, 'Day') AS day_of_week
FROM products;


-- 35. Find all products released in the current month, regardless
-- of year.
SELECT *
FROM products
WHERE EXTRACT(MONTH FROM release_date) = EXTRACT(MONTH FROM CURRENT_DATE);


-- 36. Calculate how many days each product has been in inventory
-- since its release date.
SELECT name, release_date, (CURRENT_DATE - release_date) AS days_in_inventory
FROM products;


-- 37. Find the average price of all products.
SELECT AVG(price) AS average_price
FROM products;


-- 38. Find the total stock quantity of all products.
SELECT SUM(stock_quantity) AS total_stock
FROM products;


-- 39. Find the highest and lowest product ratings.
SELECT MAX(rating) AS highest_rating, MIN(rating) AS lowest_rating
FROM products;


-- 40. Count the total number of products available for sale.
SELECT COUNT(*) AS available_products
FROM products
WHERE is_available = TRUE;


-- 41. Find the average price, minimum price, maximum price, and
-- total number of products in a single result.
SELECT
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    COUNT(*) AS total_products
FROM products;
