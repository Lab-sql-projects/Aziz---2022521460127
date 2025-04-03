-- INNER JOIN: Find all dreams with their category names
SELECT d.dream_id, d.dream_date, d.clarity_level, d.description,
       dc.category_name, dc.description as category_description
FROM Dreams d
INNER JOIN DreamCategories dc ON d.category_id = dc.category_id
ORDER BY d.dream_date DESC;

-- LEFT JOIN: Get all users and their dreams (including users with no dreams)
SELECT u.user_id, u.username, u.email, d.dream_id, d.dream_date, d.description
FROM Users u
LEFT JOIN Dreams d ON u.user_id = d.user_id
ORDER BY u.username, d.dream_date;

-- UPDATE: Update clarity level for dreams that are marked as lucid
UPDATE Dreams
SET clarity_level = clarity_level + 1
WHERE is_lucid = TRUE AND clarity_level < 10;

-- DELETE: Remove dreams that have very low clarity and are older than 1 year
DELETE FROM Dreams
WHERE clarity_level < 3 
  AND dream_date < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR);

-- AGGREGATION with GROUP BY and HAVING: 
-- Find users who have recorded more than 1 dream with high clarity level
SELECT u.user_id, u.username, COUNT(d.dream_id) as dream_count,
       AVG(d.clarity_level) as avg_clarity
FROM Users u
JOIN Dreams d ON u.user_id = d.user_id
WHERE d.clarity_level > 5
GROUP BY u.user_id, u.username
HAVING COUNT(d.dream_id) > 1
ORDER BY avg_clarity DESC;

-- SUBQUERY: Find dreams that contain symbols that appear more frequently 
-- than the average symbol appearance count
SELECT d.dream_id, d.dream_date, d.description, COUNT(ds.symbol_id) as symbol_count
FROM Dreams d
JOIN DreamSymbols ds ON d.dream_id = ds.dream_id
GROUP BY d.dream_id, d.dream_date, d.description
HAVING COUNT(ds.symbol_id) > (
    SELECT AVG(symbol_count) 
    FROM (
        SELECT dream_id, COUNT(symbol_id) as symbol_count
        FROM DreamSymbols
        GROUP BY dream_id
    ) as avg_symbols
)
ORDER BY symbol_count DESC;
