FROM php:8.2-apache
ARG TIMEZONE

COPY php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

# installation de wget
RUN apt install -y wget
# Téléchargement et installation de Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash
# Définition de la variable PATH pour inclure Symfony CLI
RUN echo 'export PATH="$HOME/.symfony5/bin:$PATH"' >> /root/.bashrc
# Source du fichier .bashrc pour appliquer les modifications immédiatement
RUN echo 'source /root/.bashrc' >> /root/.bash_profile

RUN docker-php-ext-configure gd --with-jpeg --with-freetype 

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Activer le module Apache mod_rewrite
RUN a2enmod rewrite


RUN service apache2 restart

WORKDIR /var/www/html