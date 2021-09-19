FROM php:7.4-fpm

RUN pear config-set \
    && pecl install APCu xdebug-3.0.4 APCu \
    && docker-php-ext-enable apcu xdebug apcu

ADD php.ini /usr/local/etc/php/php.ini
