FROM php:fpm-alpine

ARG GID
ARG UID

ENV GID=${GID}
ENV UID=${UID}

RUN addgroup -g ${GID} --system laravel
RUN adduser  -G laravel --system -D -s /bin/sh -u ${UID} laravel
RUN sed -i "s/user = www-data/user = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = laravel/g" /usr/local/etc/php-fpm.d/www.conf
