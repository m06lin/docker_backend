FROM php:8.1-fpm-alpine
# RUN docker-php-ext-install mysqli pdo pdo_mysql gd && docker-php-ext-enable pdo_mysql
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update \
    && apk upgrade \
    && apk --update add logrotate \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && apk add --no-cache git


RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli pdo pdo_mysql gd zip sockets && docker-php-ext-enable pdo_mysql gd sockets
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    mv phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs

RUN curl -OL https://phar.phpunit.de/phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit


EXPOSE 80