FROM ghcr.io/pierreribault/larvel-test-phpfpm:base AS php-fpm
LABEL maintainer="Pierre Ribault <contact@pierreribault.fr>"

USER root

# Remove composer
RUN rm /usr/bin/composer

# Copy project
COPY --chown=www-data:www-data ./application /app
RUN chown www-data:www-data /app

USER www-data
