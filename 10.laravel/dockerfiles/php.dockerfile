FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql

# give write access to /var/www/html to the linux user inside the container
RUN chown -R www-data:www-data /var/www/html 