FROM php:7.4-fpm

ADD ca /usr/local/share/ca-certificates/

RUN update-ca-certificates \
    && apt-get update \
    && pecl install xdebug-3.0.4 \
    && apt-get install -y curl git unzip libpq-dev libcurl4-openssl-dev libzip-dev libssl-dev librabbitmq-dev libxml2-dev libsodium-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql zip sockets soap intl bcmath \
    && docker-php-ext-enable xdebug pdo_pgsql pgsql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /application

