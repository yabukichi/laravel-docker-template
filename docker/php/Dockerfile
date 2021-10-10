FROM php:7.3-fpm
COPY php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get install -y zlib1g-dev libzip-dev mariadb-client libpq-dev \
    && docker-php-ext-install zip pdo_pgsql 

#Composer install
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www

RUN composer global require "laravel/installer"

RUN echo "file_uploads = On\n" \
         "memory_limit = 5000M\n" \
         "upload_max_filesize = 5000M\n" \
         "post_max_size = 5000M\n" \
         "max_execution_time = 6000\n" \
         > /usr/local/etc/php/conf.d/uploads.ini