FROM php:7.3-fpm-alpine
# RUN docker-php-ext-install mysqli pdo pdo_mysql gd && docker-php-ext-enable pdo_mysql
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli pdo pdo_mysql gd zip && docker-php-ext-enable pdo_mysql
RUN pecl install mysql_xdevapi

EXPOSE 80