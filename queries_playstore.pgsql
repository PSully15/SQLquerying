-- 1. Find app with an id of 1880
SELECT *
FROM analytics
WHERE id = 1880;

-- 2. Find the id and app_name for all apps, last updated on August 01, 2018(2018-08-01)
SELECT id, name
FROM analytics
WHERE last_updated = '2018-08-01';

-- 3. Count number of apps in each category ex.(FAMILY | 1789)
SELECT category, COUNT(*) 
FROM analytics 
GROUP BY category;

-- 4. Find top 5 most reviewed apps
SELECT app_name, reviews
FROM analytics
ORDER BY reviews DESC
LIMIT 5;

-- 5. Find app that has the most reviews with rating of 4.8 or higher
SELECT app_name, reviews, rating
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews DESC
LIMIT 1;

-- 6. Find avg rating for each category ordered from highest to lowest rating
SELECT category, AVG(rating)
FROM analytics
GROUP BY category
ORDER BY AVG DESC;

-- 7. Display app_name, price and rating of most expensive app with rating less than 3 
SELECT app_name, price, rating 
FROM analytics 
WHERE rating < 3 
GROUP BY app_name, price, rating 
ORDER BY price DESC 
LIMIT 1;

-- 8. Find all apps with a min install not exceeding 50 with rating of 1 or higher, order by highest
SELECT app_name, min_install, rating 
FROM analytics 
WHERE min_install <= 50 AND rating >= 1 
ORDER BY rating DESC;

-- 9. Find names of all apps rated less than 3 with 10000 or more reviews
SELECT app_name, reviews, rating
FROM analytics
WHERE rating < 3 AND reviews >= 10000;

-- 10. Find top 10 most reviewed apps that cost between 10 cents and 1 dollar
SELECT app_name, reviews, price
FROM analytics
WHERE price
BETWEEN 0.1 AND 1
ORDER BY reviews DESC
LIMIT 10;

-- 11. 
SELECT app_name, last_updated 
FROM analytics 
ORDER BY last_updated ASC
LIMIT 1;
-- OR
SELECT app_name, last_updated
FROM analysis
WHERE last_updated = 
(
  SELECT MIN(last_updated) 
  FROM analytics
);

-- 12. 
SELECT app_name, price 
FROM analytics 
ORDER BY price DESC 
LIMIT 1;
-- OR
SELECT app_name, price 
FROM analytics 
WHERE price = 
(
  SELECT MAX(price) 
  FROM analytics
);

-- 13. Sum all reviews in the Google Play Store
SELECT SUM(reviews) AS all_reviews
FROM analytics;

-- 14. Find all categories that have more than 300 apps in them
SELECT category 
FROM analytics 
GROUP BY category 
HAVING COUNT(*) > 300;

-- 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;