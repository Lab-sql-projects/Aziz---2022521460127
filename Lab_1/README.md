# DreamScape Nexus

## Project Description
DreamScape Nexus is an innovative database system designed to map the intricate landscape of human dreams. This platform serves as a digital repository where dreamers can document their nocturnal journeys, creating a collective atlas of subconscious experiences. The system captures the ephemeral nature of dreams through detailed recording, categorization, and analysis of dream narratives, symbols, and emotional resonances.

Key features include:
- Personalized dreamer profiles with secure authentication
- Comprehensive dream documentation with clarity and duration metrics
- Multi-dimensional dream categorization framework
- Symbol tracking with significance interpretation
- Emotional pattern recognition across dream experiences
- Advanced query capabilities for identifying recurring themes and patterns

DreamScape Nexus bridges the gap between personal dream journaling and scientific exploration, offering insights into the mysterious realm of human consciousness during sleep. The database architecture supports both individual self-discovery and potential applications in sleep research, psychology, and cognitive science.

## Files in this Repository

### 1. schema.sql
This file contains the SQL commands to create the DreamScape Nexus database and its table structure. It defines:
- The `dream_monitoring` database
- `Users` table for storing dreamer information and authentication details
- `DreamCategories` table for categorizing different types of dreams
- `Dreams` table for recording individual dream experiences with metadata
- `DreamSymbols` table for tracking symbols that appear in dreams
- All necessary constraints including primary keys, foreign keys, and data validation rules

### 2. insert.sql
This file populates the database with sample data to demonstrate functionality. It includes:
- Sample user profiles with usernames and authentication information
- Dream category definitions with descriptions
- Example dream records with varying characteristics (lucidity, clarity, emotions)
- Dream symbol entries with significance interpretations and frequency counts
- The sample data provides a foundation for testing queries and understanding the database structure

### 3. queries.sql
This file contains example SQL queries that demonstrate how to extract meaningful information from the DreamScape Nexus database:
- User-specific dream retrieval and chronological ordering
- Emotional pattern analysis across dreams
- Lucid dream frequency by user
- Dream clarity analysis by category
- Symbol frequency analysis
- Complex condition-based queries for dream characteristics

## Database Schema Overview
- **Users**: Stores dreamer profiles and authentication details
- **DreamCategories**: Defines different types of dreams for classification
- **Dreams**: Records individual dream experiences with metadata
- **DreamSymbols**: Tracks symbols appearing in dreams and their significance
