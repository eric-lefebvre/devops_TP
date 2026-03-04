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
('Aatrox','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Aatrox.png'),
('Ahri','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ahri.png'),
('Akali','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Akali.png'),
('Akshan','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Akshan.png'),
('Alistar','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Alistar.png'),
('Amumu','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Amumu.png'),
('Anivia','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Anivia.png'),
('Annie','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Annie.png'),
('Aphelios','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Aphelios.png'),
('Ashe','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ashe.png'),
('Aurelion Sol','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/AurelionSol.png'),
('Azir','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Azir.png'),
('Bard','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Bard.png'),
('Blitzcrank','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Blitzcrank.png'),
('Brand','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Brand.png'),
('Braum','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Braum.png'),
('Caitlyn','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Caitlyn.png'),
('Camille','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Camille.png'),
('Cassiopeia','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Cassiopeia.png'),
('Corki','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Corki.png'),
('Darius','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Darius.png'),
('Diana','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Diana.png'),
('Dr. Mundo','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/DrMundo.png'),
('Draven','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Draven.png'),
('Ekko','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ekko.png'),
('Elise','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Elise.png'),
('Evelynn','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Evelynn.png'),
('Ezreal','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ezreal.png'),
('Fiddlesticks','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Fiddlesticks.png'),
('Fiora','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Fiora.png'),
('Fizz','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Fizz.png'),
('Galio','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Galio.png'),
('Gangplank','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Gangplank.png'),
('Garen','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Garen.png'),
('Gnar','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Gnar.png'),
('Gragas','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Gragas.png'),
('Graves','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Graves.png'),
('Gwen','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Gwen.png'),
('Hecarim','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Hecarim.png'),
('Heimerdinger','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Heimerdinger.png'),
('Illaoi','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Illaoi.png'),
('Irelia','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Irelia.png'),
('Ivern','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ivern.png'),
('Janna','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Janna.png'),
('Jarvan IV','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/JarvanIV.png'),
('Jax','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Jax.png'),
('Jayce','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Jayce.png'),
('Jhin','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Jhin.png'),
('Jinx','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Jinx.png'),
('K\'Sante','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/KSante.png'),
('Kai\'Sa','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kaisa.png'),
('Kalista','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kalista.png'),
('Karma','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Karma.png'),
('Karthus','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Karthus.png'),
('Kassadin','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kassadin.png'),
('Katarina','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Katarina.png'),
('Kayle','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kayle.png'),
('Kayn','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kayn.png'),
('Kennen','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kennen.png'),
('Kha\'Zix','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Khazix.png'),
('Kindred','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kindred.png'),
('Kled','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Kled.png'),
('Kog\'Maw','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/KogMaw.png'),
('Lee Sin','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/LeeSin.png'),
('Leona','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Leona.png'),
('Lillia','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Lillia.png'),
('Lissandra','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Lissandra.png'),
('Lucian','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Lucian.png'),
('Lulu','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Lulu.png'),
('Lux','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Lux.png'),
('Malphite','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Malphite.png'),
('Malzahar','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Malzahar.png'),
('Maokai','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Maokai.png'),
('Master Yi','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/MasterYi.png'),
('Miss Fortune','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/MissFortune.png'),
('Mordekaiser','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Mordekaiser.png'),
('Morgana','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Morgana.png'),
('Nami','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nami.png'),
('Nasus','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nasus.png'),
('Nautilus','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nautilus.png'),
('Neeko','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Neeko.png'),
('Nidalee','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nidalee.png'),
('Nilah','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nilah.png'),
('Nocturne','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nocturne.png'),
('Nunu & Willump','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Nunu.png'),
('Olaf','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Olaf.png'),
('Orianna','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Orianna.png'),
('Ornn','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ornn.png'),
('Pantheon','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Pantheon.png'),
('Poppy','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Poppy.png'),
('Pyke','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Pyke.png'),
('Qiyana','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Qiyana.png'),
('Quinn','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Quinn.png'),
('Rakan','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Rakan.png'),
('Rammus','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Rammus.png'),
('Rek\'Sai','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/RekSai.png'),
('Rell','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Rell.png'),
('Renekton','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Renekton.png'),
('Rengar','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Rengar.png'),
('Riven','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Riven.png'),
('Rumble','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Rumble.png'),
('Ryze','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ryze.png'),
('Samira','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Samira.png'),
('Sejuani','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sejuani.png'),
('Senna','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Senna.png'),
('Seraphine','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Seraphine.png'),
('Sett','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sett.png'),
('Shaco','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Shaco.png'),
('Shen','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Shen.png'),
('Shyvana','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Shyvana.png'),
('Singed','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Singed.png'),
('Sion','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sion.png'),
('Sivir','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sivir.png'),
('Skarner','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Skarner.png'),
('Sona','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sona.png'),
('Soraka','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Soraka.png'),
('Swain','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Swain.png'),
('Sylas','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Sylas.png'),
('Syndra','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Syndra.png'),
('Tahm Kench','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/TahmKench.png'),
('Taliyah','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Taliyah.png'),
('Talon','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Talon.png'),
('Taric','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Taric.png'),
('Teemo','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Teemo.png'),
('Thresh','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Thresh.png'),
('Tristana','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Tristana.png'),
('Trundle','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Trundle.png'),
('Tryndamere','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Tryndamere.png'),
('Twisted Fate','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/TwistedFate.png'),
('Twitch','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Twitch.png'),
('Udyr','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Udyr.png'),
('Urgot','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Urgot.png'),
('Varus','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Varus.png'),
('Vayne','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Vayne.png'),
('Veigar','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Veigar.png'),
('Vel\'Koz','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/VelKoz.png'),
('Vex','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Vex.png'),
('Vi','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Vi.png'),
('Viego','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Viego.png'),
('Viktor','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Viktor.png'),
('Vladimir','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Vladimir.png'),
('Volibear','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Volibear.png'),
('Warwick','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Warwick.png'),
('Xayah','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Xayah.png'),
('Xerath','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Xerath.png'),
('Xin Zhao','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/XinZhao.png'),
('Yasuo','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Yasuo.png'),
('Yone','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Yone.png'),
('Yorick','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Yorick.png'),
('Yuumi','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Yuumi.png'),
('Zac','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zac.png'),
('Zed','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zed.png'),
('Zeri','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zeri.png'),
('Ziggs','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Ziggs.png'),
('Zilean','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zilean.png'),
('Zoe','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zoe.png'),
('Zyra','https://ddragon.leagueoflegends.com/cdn/16.5.1/img/champion/Zyra.png');

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