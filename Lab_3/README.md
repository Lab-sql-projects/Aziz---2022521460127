# DreamScape Nexus - SQL Lab 3

## 1. Create a VIEW

```sql
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
```

This view provides a simplified way to access dream data with their associated categories, hiding the complexity of the join operation and presenting only the most relevant fields for public consumption.

## 2. Add INTEGRITY CONSTRAINTS

### Constraint 1: Ensure dream clarity is rated between 1-10

```sql
ALTER TABLE Dreams
ADD CONSTRAINT chk_clarity_range
CHECK (clarity_level BETWEEN 1 AND 10);
```

### Constraint 2: Ensure dream symbols have meaningful names

```sql
ALTER TABLE DreamSymbols
ADD CONSTRAINT chk_symbol_name
CHECK (LENGTH(TRIM(symbol_name)) > 0);
```

These constraints enforce data quality by ensuring that clarity levels fall within a valid range and that symbol names cannot be empty strings.

## 3. Create an INDEX

```sql
CREATE INDEX idx_dream_date ON Dreams(dream_date);
```

This index improves query performance when searching or sorting dreams by date, which is a common operation in the dream monitoring system.

## 4. Create and test a TRANSACTION

```sql
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

COMMIT;
```

This transaction demonstrates how to ensure that related data (a dream and its associated symbols) are either all inserted successfully or none at all, maintaining database integrity.

## 5. Write a COMPLEX QUERY (JOIN + SUBQUERY)

```sql
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
```

This advanced query identifies dreams containing symbols that appear more frequently than the average symbol frequency, providing insights into common dream patterns across users.

## Bonus: Authorization (Role & Grant)

```sql
CREATE ROLE dream_researcher;
GRANT SELECT ON PublicDreamView TO dream_researcher;
GRANT SELECT ON DreamCategories TO dream_researcher;
CREATE USER 'researcher'@'localhost' IDENTIFIED BY 'P2zzm0rd!@#';
GRANT dream_researcher TO 'researcher'@'localhost';
```

This demonstrates how to create a role-based access control system, where dream researchers can access specific views and tables without having full access to the underlying database.
