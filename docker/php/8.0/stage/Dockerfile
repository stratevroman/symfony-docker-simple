FROM php:8.3-fpm

RUN update-ca-certificates \
    && apt-get update \
    && pecl install xdebug-3.3.1 \
    && apt-get install -y curl git unzip libpq-dev libcurl4-openssl-dev libzip-dev libssl-dev librabbitmq-dev libxml2-dev libsodium-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql zip sockets soap intl bcmath \
    && docker-php-ext-enable xdebug pdo_pgsql pgsql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ADD php.ini /usr/local/etc/php/php.ini

WORKDIR /application
