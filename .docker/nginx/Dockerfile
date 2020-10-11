FROM ghcr.io/pierreribault/larvel-test-php-fpm:base AS nginx
LABEL maintainer="Pierre Ribault <contact@pierreribault.fr>"

USER root

# Copy project
COPY --chown=www-data:www-data application/public /app/public
COPY --chown=www-data:www-data application/storage /app/storage
COPY --chown=www-data:www-data application/bootstrap /app/bootstrap
RUN ln -sr /app/storage/app/public /app/public/storage

USER www-data
