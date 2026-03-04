-- On utilise la base créée par docker-compose
USE app_db;

-- =========================
-- Table Champion
-- =========================
CREATE TABLE IF NOT EXISTS champion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    image_url VARCHAR(255) NOT NULL
);

-- =========================
-- Table Draft
-- =========================
CREATE TABLE IF NOT EXISTS draft (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_draft DATETIME NOT NULL,
    ligue VARCHAR(100) NOT NULL,
    team_blueside VARCHAR(100) NOT NULL,
    team_redside VARCHAR(100) NOT NULL
);

-- =========================
-- Table Pick / Ban
-- =========================
CREATE TABLE IF NOT EXISTS pick (
    id INT AUTO_INCREMENT PRIMARY KEY,
    champion_id INT NOT NULL,
    draft_id INT NOT NULL,
    slot ENUM(
        'B1','B2','B3','B4','B5',
        'R1','R2','R3','R4','R5',
        'BB1','BB2','BB3','BB4','BB5',
        'RB1','RB2','RB3','RB4','RB5'
    ) NOT NULL,
    FOREIGN KEY (champion_id) REFERENCES champion(id) ON DELETE CASCADE,
    FOREIGN KEY (draft_id) REFERENCES draft(id) ON DELETE CASCADE,
    UNIQUE(draft_id, slot),
    UNIQUE(draft_id, champion_id)
);

-- =========================
-- Données initiales Champions
-- =========================
INSERT INTO champion (nom, image_url) VALUES
('Ahri', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_0.jpg'),
('Lee Sin', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/LeeSin_0.jpg'),
('Jinx', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_0.jpg'),
('Garen', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Garen_0.jpg'),
('Thresh', 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Thresh_0.jpg');

-- =========================
-- Draft exemple
-- =========================
INSERT INTO draft (date_draft, ligue, team_blueside, team_redside) VALUES
('2025-03-01 18:00:00', 'LEC', 'G2 Esports', 'Fnatic');

-- =========================
-- Picks exemple (draft id = 1)
-- =========================
INSERT INTO pick (champion_id, draft_id, slot) VALUES
(1, 1, 'B1'),
(2, 1, 'R1'),
(3, 1, 'B2'),
(4, 1, 'R2'),
(5, 1, 'B3');