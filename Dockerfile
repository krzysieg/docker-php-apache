FROM php:8.0-apache

RUN apt-get update; \
    apt-get install -y libpq-dev libpng-dev libonig-dev unzip git vim cron; \
    a2enmod rewrite; \
    docker-php-ext-install -j$(nproc) gd pdo pdo_pgsql pgsql bcmath tokenizer mbstring ctype json; \
    apt-get clean; \
    apt-get -y autoremove; \
    rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/
COPY security.conf /etc/apache2/conf-enabled/
COPY 000-default.conf /etc/apache2/sites-available/
COPY php.ini /usr/local/etc/php/