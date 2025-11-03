-- Goal: Calculate the average sales and scores by game Genre 
-- This helps identify potential target markets and quality expectations.

USE game_studio_db; -- Make sure you select your database first!

SELECT
    genre,
    COUNT(game_name) AS total_games,
    ROUND(SUM(global_sales), 2) AS total_global_sales_millions,
    ROUND(AVG(critic_score), 2) AS avg_critic_score,
    ROUND(AVG(user_score), 2) AS avg_user_score
FROM
    Games
WHERE
    -- We exclude games missing scores to ensure averages are meaningful
    genre IS NOT NULL 
    AND critic_score IS NOT NULL 
    AND user_score IS NOT NULL
GROUP BY
    genre
ORDER BY
    total_global_sales_millions DESC;