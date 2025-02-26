# Use PHP 8.4.3 with Apache
FROM php:8.4.3-apache

WORKDIR /var/www/html

# Mode Rewrite
RUN a2enmod rewrite

# Linux Library
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

# This error usually means that the container you're trying to access doesn't have bash installed. Some lightweight images (like alpine or node) might only have sh available by default.
# Permanent Fix: Update Dockerfile to Include bash
RUN apt-get update && apt-get install -y bash

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# PHP extensions
RUN docker-php-ext-install gettext intl pdo_mysql gd

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd

# Install Laravel if not already present
# RUN if [ ! -d "vendor" ]; then composer create-project --prefer-dist laravel/laravel .; fi

# Set Permissions for Laravel
# RUN chown -R www-data:www-data /var/www/html \
#     && chmod -R 775 /var/www/html/storage \
#     && chmod -R 775 /var/www/html/bootstrap/cache