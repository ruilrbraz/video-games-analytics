-- ==========================================================
-- SQL Schema for Video Game Analytics Project
-- Designed using a Star Schema model
-- ==========================================================

-- 1. Create the main database
CREATE DATABASE IF NOT EXISTS game_studio_db;
USE game_studio_db;

-- 2. Dimension Table: Developers
-- This table will store unique developer information.
-- We use an auto-incrementing ID as the Primary Key (PK).
CREATE TABLE Developers (
    developer_id INT AUTO_INCREMENT PRIMARY KEY,
    developer_name VARCHAR(255) NOT NULL UNIQUE,
    -- Enrichment column from API (Source 2)
    headquarters_country VARCHAR(100)
    -- Add other API fields here later if needed (e.g., founding_year)
);

-- 3. Dimension Table: Publishers
-- This table will store unique publisher information.
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL UNIQUE,
    -- Enrichment column from API (Source 2)
    founding_year YEAR
    -- Add other API fields here later if needed (e.g., website_url)
);

-- 4. Fact Table: Games
-- This is the central table containing all sales and score metrics (the "facts").
-- It connects to the Dimensions via Foreign Keys (FK).
CREATE TABLE Games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    game_name VARCHAR(255) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    genre VARCHAR(50),
    year_of_release YEAR,
    rating VARCHAR(10), -- ESRB Rating (from CSV)

    -- Foreign Keys linking to dimension tables (Crucial for JOINs!)
    fk_publisher_id INT,
    fk_developer_id INT,

    -- Metrics / Facts (all are sales in millions, use DECIMAL for precision)
    na_sales DECIMAL(10, 2),
    eu_sales DECIMAL(10, 2),
    jp_sales DECIMAL(10, 2),
    other_sales DECIMAL(10, 2),
    global_sales DECIMAL(10, 2) NOT NULL,

    -- Score Metrics
    critic_score DECIMAL(3, 1), -- e.g., 8.5
    critic_count INT,
    user_score DECIMAL(3, 1),   -- e.g., 7.7
    user_count INT,

    -- Define Foreign Key Constraints
    FOREIGN KEY (fk_publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (fk_developer_id) REFERENCES Developers(developer_id)
);

-- 5. Optional: Create an index to speed up querying by name, as this will be common.
CREATE INDEX idx_game_name ON Games(game_name);

--
