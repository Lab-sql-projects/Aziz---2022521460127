-- Create the Dream Monitoring database
CREATE DATABASE dream_monitoring;

-- Use the Dream Monitoring database
USE dream_monitoring;

-- Users table that store information about dreamers
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- DreamCategories table that categorize different types of dreams
CREATE TABLE DreamCategories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255)
);

-- Dreams table that store individual dream records
CREATE TABLE Dreams (
    dream_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT,
    dream_date DATE NOT NULL,
    duration_minutes INT,
    clarity_level INT CHECK (clarity_level BETWEEN 1 AND 10),
    description TEXT NOT NULL,
    is_lucid BOOLEAN DEFAULT FALSE,
    emotion VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES DreamCategories(category_id)
);

-- DreamSymbols table that track symbols appearing in dreams
CREATE TABLE DreamSymbols (
    symbol_id INT PRIMARY KEY,
    dream_id INT NOT NULL,
    symbol_name VARCHAR(100) NOT NULL,
    significance TEXT,
    frequency INT DEFAULT 1,
    FOREIGN KEY (dream_id) REFERENCES Dreams(dream_id)
);
