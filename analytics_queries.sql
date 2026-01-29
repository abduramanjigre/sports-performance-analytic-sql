
-- 1) Goals leaderboard (all competitions, 2024/25)
SELECT
    p.player_name,
    SUM(pss.goals) AS total_goals,
    SUM(pss.assists) AS total_assists,
    SUM(pss.matches) AS total_matches,
    ROUND(SUM(pss.goals) / NULLIF(SUM(pss.matches),0), 3) AS goals_per_match
FROM PlayerSeasonStats pss
JOIN Players p ON pss.player_id = p.player_id
JOIN Seasons s ON pss.season_id = s.season_id
WHERE s.season_name = '2024/25'
GROUP BY p.player_name
HAVING total_matches >= 5
ORDER BY total_goals DESC, goals_per_match DESC;

-- 2) Compare player efficiency between competitions (2024/25)
SELECT
    v.player_name,
    v.competition_name,
    v.matches,
    v.goals,
    v.goals_per_90
FROM v_player_season_summary v
WHERE v.season_name = '2024/25'
ORDER BY v.player_name, v.goals_per_90 DESC;

-- 3) Team goal difference by competition (2024/25)
SELECT
    t.team_name,
    c.competition_name,
    (tsr.goals_for - tsr.goals_against) AS goal_diff,
    tsr.points
FROM TeamSeasonRecords tsr
JOIN Teams t ON tsr.team_id = t.team_id
JOIN Competitions c ON tsr.competition_id = c.competition_id
JOIN Seasons s ON tsr.season_id = s.season_id
WHERE s.season_name = '2024/25'
ORDER BY goal_diff DESC, tsr.points DESC;

-- 4) View output (one-row-per-player season)
SELECT * FROM v_player_season_summary
WHERE season_name = '2024/25'
ORDER BY goals DESC, assists DESC;
