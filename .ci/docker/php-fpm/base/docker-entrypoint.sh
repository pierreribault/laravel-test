#!/bin/bash
# This script start the project Clients V2

# Waiting dependancies
/wait

# Laravel start
php artisan storage:link
php artisan config:cache
php artisan cache:clear
php artisan view:clear
php artisan migrate --force
php artisan db:seed --force

# Start supervisord
supervisord -c /etc/supervisor/conf.d/supervisord.conf
