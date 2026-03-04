# Contexte

Je veux créer une site web en PHP/CSS/JS avec une base de données SQL.
J'ai donc besoin d'un serveur Apache que je ferai tourner dans un conteneur Docker
et d'une base de données MySql qui sera dans un autre conteneur.
Pour faire fonctionner mes 2 conteneurs ensemble j'utilise docker-compose.
J'ai mis en place une CI/CD pour le git de mon projet détaillée dans .github/workflows/ci.yml.

# Mise en place de Docker

Dockerfile: utilise l'image officielle de apache 8.2 (FROM php:8.2-apache) puis installe ce qu'il faut 
pour faire fonctionner php et mysql

docker-compose.yml:
- container web avec le serveur apache
- container mysql avec le setup (login password etc) pour faire fonctionner la bdd

# Mise en place CI/CD

ci.yml a chaque pull et pr, build l'appli et la shutdown, il n'y a pas de tests pour l'instant il n'y a que LINT
mais il faudrait ajouter des étapes intermédiaires pour tester l'appli.

build: docker compose up -d --build
lint: docker exec php_apache_app find /var/www/html -name "*.php" -exec php -l {} \;
// Ajouter les tests
shutdown: docker compose down