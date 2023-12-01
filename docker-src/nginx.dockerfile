FROM nginx:1.25.3-alpine3.18-slim

ARG GID
ARG UID

ENV GID=${GID}
ENV UID=${UID}

RUN addgroup -g ${GID} --system laravel
RUN adduser  -G laravel --system -D -s /bin/sh -u ${UID} laravel
RUN sed -i "s/group = www-data/group = laravel/g" /etc/nginx/nginx.conf
