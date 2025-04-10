-- 1 Create a VIEW
CREATE VIEW PublicDreamView AS
SELECT 
    d.dream_id,
    d.dream_date,
    d.clarity_level,
    d.description,
    d.is_lucid,
    d.emotion,
    dc.category_name
FROM Dreams d
JOIN DreamCategories dc ON d.category_id = dc.category_id;

-- Test
SELECT * FROM PublicDreamView;

-- 2 Add 2 INTEGRITY CONSTRAINTS
-- Constraint 1: Ensure dream clarity is rated between 1-10
ALTER TABLE Dreams
ADD CONSTRAINT chk_clarity_range 
CHECK (clarity_level BETWEEN 1 AND 10);

-- Constraint 2: Ensure dream symbols have meaningful names (not empty)
ALTER TABLE DreamSymbols
ADD CONSTRAINT chk_symbol_name
CHECK (LENGTH(TRIM(symbol_name)) > 0);

-- Test
INSERT INTO Dreams (dream_id, user_id, dream_date, description, clarity_level)
INSERT INTO Dreams (dream_id, user_id, dream_date, description, clarity_level) 
INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name) VALUES (10, 1, 'Dragon');
INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name) VALUES (14, 5, '');

-- 3 Create an INDEX
CREATE INDEX idx_dream_date ON Dreams(dream_date);

-- Test
SHOW INDEX FROM Dreams;

-- 4 Create and test a TRANSACTION
START TRANSACTION;

-- Insert new dream
INSERT INTO Dreams (dream_id, user_id, category_id, dream_date, duration_minutes, clarity_level, description, is_lucid, emotion)
VALUES (8, 3, 2, CURRENT_DATE, 65, 9, 'Walking through an ancient library where books could speak and share forgotten knowledge', TRUE, 'Fascinated');

-- Insert dream symbols
INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name, significance, frequency)
VALUES (12, 8, 'Library', 'Collection of knowledge and memories', 1);

INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name, significance, frequency)
VALUES (13, 8, 'Books', 'Information seeking or desire for wisdom', 3);

INSERT INTO DreamSymbols (symbol_id, dream_id, symbol_name, significance, frequency)
VALUES (14, 8, 'Ancient architecture', 'Connection to collective wisdom or past lives', 1);

-- Commit transaction
COMMIT;

-- Test
SELECT * FROM Dreams WHERE dream_id = 8;
SELECT * FROM DreamSymbols WHERE dream_id = 8;

-- 5 Write a complex QUERY (JOIN + SUBQUERY)
-- Find users who have recorded dreams with symbols that appear more frequently than average
SELECT 
    u.user_id,
    u.username,
    d.dream_id,
    d.description,
    ds.symbol_name,
    ds.frequency
FROM 
    Users u
JOIN 
    Dreams d ON u.user_id = d.user_id
JOIN 
    DreamSymbols ds ON d.dream_id = ds.dream_id
WHERE 
    ds.frequency > (
        SELECT AVG(frequency) 
        FROM DreamSymbols
    )
ORDER BY 
    ds.frequency DESC,
    u.username;

-- Bonus Authorization (Role & Grant)
CREATE ROLE dream_researcher;
GRANT SELECT ON PublicDreamView TO dream_researcher;
GRANT SELECT ON DreamCategories TO dream_researcher;
CREATE USER 'researcher'@'localhost' IDENTIFIED BY 'P2zzm0rd!@#';
GRANT dream_researcher TO 'researcher'@'localhost';

-- Test
SHOW GRANTS FOR 'researcher'@'localhost';