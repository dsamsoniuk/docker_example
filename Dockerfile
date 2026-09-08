FROM php:8.2-fpm

WORKDIR /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY public/ .

# Flaga -t ustaw jako katalog glowny public
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]