-- Select all dreams for a specific user, ordered by date
SELECT d.dream_id, d.dream_date, d.description, c.category_name, d.emotion
FROM Dreams d
JOIN DreamCategories c ON d.category_id = c.category_id
WHERE d.user_id = 1
ORDER BY d.dream_date DESC;

-- Find the most common dream emotions across all users
SELECT emotion, COUNT(*) as frequency
FROM Dreams
WHERE emotion IS NOT NULL
GROUP BY emotion
ORDER BY frequency DESC
LIMIT 5;

-- Identify users who have had lucid dreams
SELECT u.username, COUNT(d.dream_id) as lucid_dream_count
FROM Users u
JOIN Dreams d ON u.user_id = d.user_id
WHERE d.is_lucid = TRUE
GROUP BY u.username
ORDER BY lucid_dream_count DESC;

-- Find the average clarity level of dreams by category
SELECT c.category_name, AVG(d.clarity_level) as avg_clarity
FROM Dreams d
JOIN DreamCategories c ON d.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_clarity DESC;

-- Find the most common symbols across all dreams
SELECT s.symbol_name, SUM(s.frequency) as total_appearances
FROM DreamSymbols s
GROUP BY s.symbol_name
ORDER BY total_appearances DESC
LIMIT 10;

-- Find dreams with high clarity (8+) that lasted more than 45 minutes
SELECT d.dream_id, u.username, d.description, d.clarity_level, d.duration_minutes
FROM Dreams d
JOIN Users u ON d.user_id = u.user_id
WHERE d.clarity_level >= 8 AND d.duration_minutes > 45
ORDER BY d.clarity_level DESC;
