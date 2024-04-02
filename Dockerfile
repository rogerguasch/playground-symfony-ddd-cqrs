FROM composer:latest as composer

FROM php:8.3-fpm

WORKDIR /app

# Install dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libpq-dev \
    libicu-dev \
    && pecl install xdebug apcu \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd opcache intl \
    && docker-php-ext-enable opcache apcu xdebug

# INI files for all services
COPY docker/php/ /usr/local/etc/php/

# Install Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash -s - --install-dir /usr/local/bin

# Instalar composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# allow non-root users have home
RUN mkdir -p /opt/home
RUN chmod 777 /opt/home
ENV HOME /opt/home

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
