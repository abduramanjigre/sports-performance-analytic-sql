
-- Sports Performance Analytics Database
-- MySQL 8+ compatible

DROP TABLE IF EXISTS PlayerSeasonStats;
DROP TABLE IF EXISTS TeamSeasonRecords;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Competitions;
DROP TABLE IF EXISTS Seasons;

CREATE TABLE Seasons (
    season_id INT AUTO_INCREMENT PRIMARY KEY,
    season_name VARCHAR(20) NOT NULL UNIQUE,  -- e.g., '2024/25'
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE Competitions (
    competition_id INT AUTO_INCREMENT PRIMARY KEY,
    competition_name VARCHAR(60) NOT NULL UNIQUE, -- e.g., 'La Liga'
    competition_type ENUM('League','Cup','Continental') NOT NULL
);

CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(80) NOT NULL UNIQUE,
    country VARCHAR(60) NULL
);

CREATE TABLE Players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(80) NOT NULL,
    primary_position VARCHAR(30) NULL,
    team_id INT NOT NULL,
    CONSTRAINT fk_players_team
        FOREIGN KEY (team_id) REFERENCES Teams(team_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE TeamSeasonRecords (
    team_id INT NOT NULL,
    season_id INT NOT NULL,
    competition_id INT NOT NULL,
    matches_played INT NOT NULL DEFAULT 0,
    wins INT NOT NULL DEFAULT 0,
    draws INT NOT NULL DEFAULT 0,
    losses INT NOT NULL DEFAULT 0,
    goals_for INT NOT NULL DEFAULT 0,
    goals_against INT NOT NULL DEFAULT 0,
    points INT NOT NULL DEFAULT 0,
    PRIMARY KEY (team_id, season_id, competition_id),
    CONSTRAINT fk_tsr_team FOREIGN KEY (team_id) REFERENCES Teams(team_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_tsr_season FOREIGN KEY (season_id) REFERENCES Seasons(season_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_tsr_comp FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE PlayerSeasonStats (
    player_id INT NOT NULL,
    season_id INT NOT NULL,
    competition_id INT NOT NULL,
    matches INT NOT NULL DEFAULT 0,
    minutes INT NOT NULL DEFAULT 0,
    goals INT NOT NULL DEFAULT 0,
    assists INT NOT NULL DEFAULT 0,
    shots INT NOT NULL DEFAULT 0,
    key_passes INT NOT NULL DEFAULT 0,
    yellow_cards INT NOT NULL DEFAULT 0,
    red_cards INT NOT NULL DEFAULT 0,
    PRIMARY KEY (player_id, season_id, competition_id),
    CONSTRAINT fk_pss_player FOREIGN KEY (player_id) REFERENCES Players(player_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pss_season FOREIGN KEY (season_id) REFERENCES Seasons(season_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pss_comp FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
