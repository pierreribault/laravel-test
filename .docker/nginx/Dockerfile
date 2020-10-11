FROM bitnami/nginx:1.18 AS nginx
LABEL maintainer="Pierre Ribault <ontact@pierreribault.fr>"

USER root

ENV WAIT_VERSION="2.7.3"

# Add Docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# Configuration of Nginx
COPY .docker/nginx/base/conf/appserver.conf /opt/bitnami/nginx/conf/server_blocks/appserver.conf

# Configuration of Entrypoint
COPY .docker/nginx/base/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Modify nginx permission
RUN chown www-data:daemon /opt/bitnami/nginx/tmp \
    && chmod 775 /opt/bitnami/nginx/tmp

# Copy project
COPY --chown=www-data:www-data application/public /app/public
COPY --chown=www-data:www-data application/storage /app/storage
COPY --chown=www-data:www-data application/bootstrap /app/bootstrap
RUN ln -sr /app/storage/app/public /app/public/storage

USER www-data

CMD ["/docker-entrypoint.sh"]