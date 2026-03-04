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

// Récupérer tous les champions
$stmt = $pdo->query("SELECT nom, image_url FROM champion ORDER BY nom ASC");
$champions = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Champions LoL</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>Champions League of Legends</h1>
    </header>

    <main>
        <div class="champion-container">
            <?php foreach ($champions as $champion): ?>
                <div class="champion-card">
                    <img src="<?= htmlspecialchars($champion['image_url']) ?>" alt="<?= htmlspecialchars($champion['nom']) ?>">
                    <h2><?= htmlspecialchars($champion['nom']) ?></h2>
                </div>
            <?php endforeach; ?>
        </div>
    </main>
</body>
</html>