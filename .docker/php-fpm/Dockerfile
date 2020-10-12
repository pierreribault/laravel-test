FROM ghcr.io/pierreribault/laravel-test-php-fpm:base
LABEL maintainer="Pierre Ribault <contact@pierreribault.fr>"

# Add Docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# Configuration of PHP-FPM
COPY --chown=1001:1001 .docker/php-fpm/base/php-fpm/php-fpm.conf /opt/bitnami/php/etc/php-fpm.d/www.conf
COPY .docker/php-fpm/base/php-fpm/php.conf /opt/bitnami/php/etc/conf.d/custom.ini

# Configuration of Supervisor
COPY .docker/php-fpm/base/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configuration of Entrypoint
COPY .docker/php-fpm/base/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Modify php-fpm permissions
RUN chown www-data:daemon /opt/bitnami/php/tmp \
    && chmod 775 /opt/bitnami/php/tmp

# Copy project
COPY --chown=www-data:www-data ./application /app
RUN chown www-data:www-data /app

USER www-data

CMD ["/docker-entrypoint.sh"]