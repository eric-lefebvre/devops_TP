FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

# Copier les fichiers pour la prod
COPY --chown=www-data:www-data . /var/www/html/

EXPOSE 80