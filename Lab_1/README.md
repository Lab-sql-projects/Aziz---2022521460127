# DreamScape Nexus - Lab 1

## 1. schema.sql

This file contains the SQL commands to create the DreamScape Nexus database and its table structure. It defines:

- The `dream_monitoring` database
- `Users` table for storing dreamer information and authentication details
- `DreamCategories` table for categorizing different types of dreams
- `Dreams` table for recording individual dream experiences with metadata
- `DreamSymbols` table for tracking symbols that appear in dreams
- Constraints including primary keys, foreign keys, data validation rules, and a check constraint for `clarity_level` (values between 1 and 10)

## 2. insert.sql

This file populates the database with sample data to demonstrate functionality. It includes:

- Sample user profiles with usernames, emails, and hashed passwords
- Dream category definitions with descriptions
- Example dream records with varying characteristics (lucidity, clarity, emotions, and durations)
- Dream symbol entries with significance interpretations and frequency counts
- The sample data provides a foundation for testing queries and understanding the database structure

## 3. queries.sql

This file contains example SQL queries that demonstrate how to extract meaningful information from the DreamScape Nexus database:

- **Select dreams for a specific user**: Retrieve all dreams for a specific user, ordered by date
- **Most common dream emotions**: Find the top 5 most common dream emotions across all users
- **Lucid dreamers**: Identify users who have had lucid dreams and count their lucid dream occurrences
- **Average clarity by category**: Calculate the average clarity level of dreams grouped by category
- **Most common symbols**: Find the top 10 most common symbols across all dreams based on their total appearances
- **High clarity and long duration dreams**: Retrieve dreams with high clarity (8+) that lasted more than 45 minutes
