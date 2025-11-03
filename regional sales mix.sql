-- Goal: Calculate the percentage distribution of sales between NA and JP for the top genres.
-- This tests Hypothesis 2 by seeing if Action/Role-Playing show a higher JP focus than others.

USE game_studio_db;

SELECT
    G.genre,
    COUNT(G.game_name) AS total_games_in_genre,
    -- Calculate total sales, excluding games where sales are null
    ROUND(SUM(G.global_sales), 2) AS total_global_sales_millions,
    
    -- Calculate Sales Distribution
    ROUND(SUM(G.na_sales) / SUM(G.global_sales) * 100, 2) AS pct_na_sales,
    ROUND(SUM(G.jp_sales) / SUM(G.global_sales) * 100, 2) AS pct_jp_sales,
    
    -- Optional: Join to demonstrate relational query for the project's requirement
    COUNT(DISTINCT P.publisher_name) AS unique_publishers
FROM
    Games AS G
JOIN
    Publishers AS P ON G.fk_publisher_id = P.publisher_id
WHERE
    G.genre IN ('Action', 'Role-Playing', 'Sports', 'Platform')
GROUP BY
    G.genre
ORDER BY
    total_global_sales_millions DESC;
