
-- Sample data (demo numbers)

INSERT INTO Seasons (season_name, start_date, end_date) VALUES
('2023/24','2023-08-01','2024-06-30'),
('2024/25','2024-08-01','2025-06-30');

INSERT INTO Competitions (competition_name, competition_type) VALUES
('La Liga','League'),
('UEFA Champions League','Continental');

INSERT INTO Teams (team_name, country) VALUES
('Real Madrid','Spain'),
('FC Barcelona','Spain'),
('Manchester City','England');

INSERT INTO Players (player_name, primary_position, team_id) VALUES
('Jude Bellingham','Midfielder', 1),
('Vinícius Júnior','Forward', 1),
('Rodrygo','Forward', 1),
('Robert Lewandowski','Forward', 2),
('Erling Haaland','Forward', 3);

INSERT INTO TeamSeasonRecords
(team_id, season_id, competition_id, matches_played, wins, draws, losses, goals_for, goals_against, points)
VALUES
(1, 2, 1, 38, 28, 6, 4, 85, 30, 90),
(2, 2, 1, 38, 24, 7, 7, 78, 40, 79),
(3, 2, 2, 12, 8, 2, 2, 28, 12, 26),
(1, 2, 2, 12, 7, 3, 2, 24, 10, 24);

INSERT INTO PlayerSeasonStats
(player_id, season_id, competition_id, matches, minutes, goals, assists, shots, key_passes, yellow_cards, red_cards)
VALUES
(1, 2, 1, 33, 2700, 18, 7, 78, 55, 6, 0),
(2, 2, 1, 30, 2400, 16, 9, 95, 62, 5, 0),
(3, 2, 1, 31, 2450, 12, 8, 70, 48, 4, 0),
(1, 2, 2, 10, 840, 5, 2, 24, 18, 2, 0),
(2, 2, 2, 9, 780, 4, 3, 28, 20, 1, 0),
(4, 2, 1, 34, 2850, 21, 5, 110, 40, 3, 0),
(5, 2, 2, 11, 990, 9, 1, 60, 15, 1, 0);
