
DROP VIEW IF EXISTS v_player_season_summary;

CREATE VIEW v_player_season_summary AS
SELECT
    p.player_id,
    p.player_name,
    t.team_name,
    s.season_name,
    c.competition_name,
    pss.matches,
    pss.minutes,
    pss.goals,
    pss.assists,
    ROUND(CASE WHEN pss.matches = 0 THEN 0 ELSE pss.goals / pss.matches END, 3) AS goals_per_match,
    ROUND(CASE WHEN pss.minutes = 0 THEN 0 ELSE (pss.goals * 90.0) / pss.minutes END, 3) AS goals_per_90,
    ROUND(CASE WHEN pss.minutes = 0 THEN 0 ELSE (pss.assists * 90.0) / pss.minutes END, 3) AS assists_per_90
FROM PlayerSeasonStats pss
JOIN Players p ON pss.player_id = p.player_id
JOIN Teams t ON p.team_id = t.team_id
JOIN Seasons s ON pss.season_id = s.season_id
JOIN Competitions c ON pss.competition_id = c.competition_id;
