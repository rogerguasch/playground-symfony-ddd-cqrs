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

# Configure Xdebug
#RUN echo 'xdebug.mode=debug' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo 'xdebug.client_host=host.docker.internal' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo 'xdebug.client_port=9003' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo 'xdebug.start_with_request=yes' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo -e 'xdebug.mode=debug\nxdebug.client_host=host.docker.internal\nxdebug.client_port=9003\nxdebug.start_with_request=yes' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash -s - --install-dir /usr/local/bin

# Instalar composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
