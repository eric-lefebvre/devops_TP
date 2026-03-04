<?php
// Connexion à la base de données
try {
    $pdo = new PDO(
        "mysql:host=db;dbname=app_db;charset=utf8mb4",
        "app_user",
        "app_password"
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

$draft_date = '2025-03-01 18:00:00';

// Récupérer la draft
$stmtDraft = $pdo->prepare("SELECT ligue, team_blueside, team_redside, date_draft FROM draft WHERE date_draft = :date_draft");
$stmtDraft->execute(['date_draft' => $draft_date]);
$draft = $stmtDraft->fetch(PDO::FETCH_ASSOC);

// Récupérer les picks et bans
$stmt = $pdo->prepare("
    SELECT p.slot, c.nom, c.image_url
    FROM pick p
    JOIN champion c ON p.champion_id = c.id
    JOIN draft d ON p.draft_id = d.id
    WHERE d.date_draft = :date_draft
");
$stmt->execute(['date_draft' => $draft_date]);
$picks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Organiser par équipe
$blue_picks = [];
$red_picks = [];
$blue_bans = [];
$red_bans = [];

foreach ($picks as $pick) {
    $slot = $pick['slot'];
    if (str_starts_with($slot, 'B') && !str_starts_with($slot, 'BB')) {
        $blue_picks[$slot] = $pick;
    } elseif (str_starts_with($slot, 'R') && !str_starts_with($slot, 'RB')) {
        $red_picks[$slot] = $pick;
    } elseif (str_starts_with($slot, 'BB')) {
        $blue_bans[$slot] = $pick;
    } elseif (str_starts_with($slot, 'RB')) {
        $red_bans[$slot] = $pick;
    }
}

// Mélanger et choisir 4 champions à masquer
$all_picks = array_merge($blue_picks, $red_picks);
$masked_keys = array_rand($all_picks, 4);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Draft Interactive LoL</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <h1>Draft Interactive LoL</h1>
</header>

<main>
    <!-- Infos draft -->
    <div class="draft-info">
        <p><strong>Ligue :</strong> <?= htmlspecialchars($draft['ligue']) ?></p>
        <p><strong>Date :</strong> <?= htmlspecialchars($draft['date_draft']) ?></p>
    </div>

    <!-- Bans -->
    <h2>Bans</h2>
    <div class="bans-row">
        <div class="team-bans blue-bans">
            <h3><?= htmlspecialchars($draft['team_blueside']) ?></h3>
            <?php foreach ($blue_bans as $ban): ?>
                <div class="ban-card">
                    <img src="<?= htmlspecialchars($ban['image_url']) ?>" alt="<?= htmlspecialchars($ban['nom']) ?>">
                </div>
            <?php endforeach; ?>
        </div>
        <div class="team-bans red-bans">
            <h3><?= htmlspecialchars($draft['team_redside']) ?></h3>
            <?php foreach ($red_bans as $ban): ?>
                <div class="ban-card">
                    <img src="<?= htmlspecialchars($ban['image_url']) ?>" alt="<?= htmlspecialchars($ban['nom']) ?>">
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Picks -->
    <h2>Picks</h2>
    <div class="picks-row">
        <!-- Blue Team -->
        <div class="team-picks blue-team">
            <h3><?= htmlspecialchars($draft['team_blueside']) ?></h3>
            <?php foreach ($blue_picks as $slot => $pick): ?>
                <?php $is_masked = in_array($slot, $masked_keys); ?>
                <div class="pick-card" 
                     data-name="<?= htmlspecialchars($pick['nom']) ?>" 
                     data-image="<?= htmlspecialchars($pick['image_url']) ?>">
                    <img src="<?= $is_masked ? 'images/question.jpg' : htmlspecialchars($pick['image_url']) ?>" 
                         alt="<?= $is_masked ? '?' : htmlspecialchars($pick['nom']) ?>">
                    <?php if ($is_masked): ?>
                        <input type="text" placeholder="Devinez..." class="guess-input">
                        <button class="guess-btn">Valider</button>
                        <div class="feedback"></div>
                    <?php else: ?>
                        <span><?= htmlspecialchars($pick['nom']) ?></span>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>

        <!-- Red Team -->
        <div class="team-picks red-team">
            <h3><?= htmlspecialchars($draft['team_redside']) ?></h3>
            <?php foreach ($red_picks as $slot => $pick): ?>
                <?php $is_masked = in_array($slot, $masked_keys); ?>
                <div class="pick-card" 
                     data-name="<?= htmlspecialchars($pick['nom']) ?>" 
                     data-image="<?= htmlspecialchars($pick['image_url']) ?>">
                    <img src="<?= $is_masked ? 'images/question.jpg' : htmlspecialchars($pick['image_url']) ?>" 
                         alt="<?= $is_masked ? '?' : htmlspecialchars($pick['nom']) ?>">
                    <?php if ($is_masked): ?>
                        <input type="text" placeholder="Devinez..." class="guess-input">
                        <button class="guess-btn">Valider</button>
                        <div class="feedback"></div>
                    <?php else: ?>
                        <span><?= htmlspecialchars($pick['nom']) ?></span>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</main>

<script>
// Script pour deviner les champions masqués
document.querySelectorAll('.guess-btn').forEach(button => {
    button.addEventListener('click', () => {
        const card = button.closest('.pick-card');
        const input = card.querySelector('.guess-input');
        const feedback = card.querySelector('.feedback');
        const img = card.querySelector('img');
        const correctName = card.getAttribute('data-name').toLowerCase();
        const guess = input.value.trim().toLowerCase();

        if (guess === correctName) {
            img.src = card.getAttribute('data-image'); // URL exacte depuis BDD
            feedback.textContent = "Correct !";
            input.style.display = 'none';
            button.style.display = 'none';
        } else {
            feedback.textContent = "Mauvais !";
        }
    });
});
</script>
</body>
</html>