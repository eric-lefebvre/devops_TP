# Contexte

Je veux créer une site web en PHP/CSS/JS avec une base de données SQL.
J'ai donc besoin d'un serveur Apache que je ferai tourner dans un conteneur Docker
et d'une base de données MySql qui sera dans un autre conteneur.
Pour faire fonctionner mes 2 conteneurs ensemble j'utilise docker-compose.
J'ai mis en place une CI/CD pour le git de mon projet détaillée dans .github/workflows/ci.yml.

# Mise en place de Docker

Le Dockerfile utilise l'image officielle de apache 8.2
-> FROM php:8.2-apache


