FROM php:7.4-fpm-alpine
# RUN docker-php-ext-install mysqli pdo pdo_mysql gd && docker-php-ext-enable pdo_mysql
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update \
    && apk upgrade \
    && apk --update add logrotate \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add --no-cache git
ADD ./php.ini-development "$PHP_INI_DIR/php.ini"
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli pdo pdo_mysql gd zip sockets imagick && docker-php-ext-enable pdo_mysql gd sockets imagick
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

EXPOSE 80