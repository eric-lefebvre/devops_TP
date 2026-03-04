<?php
$pdo = new PDO(
    "mysql:host=db;dbname=app_db;charset=utf8mb4",
    "app_user",
    "app_password"
);

$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

echo "Connexion réussie !";
?>