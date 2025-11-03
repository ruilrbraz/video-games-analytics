-- Goal: Analyze the difference (discrepancy) between Critic Score and User Score for each platform.
-- This helps the studio see which platforms have the most polarized audience/critics.

SELECT
    platform,
    COUNT(G.game_id) AS total_games_scored,
    ROUND(AVG(G.critic_score), 2) AS avg_critic_score,
    ROUND(AVG(G.user_score), 2) AS avg_user_score,
    -- Calculate the average difference between critic and user scores
    ROUND(AVG(G.critic_score - (G.user_score * 10)), 2) AS score_discrepancy_avg
FROM
    Games AS G
WHERE
    -- Ensure we only include games with complete scores
    G.critic_score IS NOT NULL AND G.user_score IS NOT NULL
GROUP BY
    platform
HAVING
    -- Filter out platforms with very few games for meaningful averages
    total_games_scored >= 50 
ORDER BY
    score_discrepancy_avg DESC;
