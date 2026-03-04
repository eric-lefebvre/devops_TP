CREATE DATABASE IF NOT EXISTS lol_draft CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lol_draft;

-- =========================
-- Table Champion
-- =========================
CREATE TABLE champion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    image_url VARCHAR(255) NOT NULL
);

-- =========================
-- Table Draft
-- =========================
CREATE TABLE draft (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_draft DATETIME NOT NULL,
    ligue VARCHAR(100) NOT NULL,
    team_blueside VARCHAR(100) NOT NULL,
    team_redside VARCHAR(100) NOT NULL
);

-- =========================
-- Table Pick / Ban
-- =========================
CREATE TABLE pick (
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
    UNIQUE(draft_id, slot)
);