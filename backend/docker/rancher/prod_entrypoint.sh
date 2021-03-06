#!/usr/bin/env bash

cd /var/www/ol/backend
rm -r vendor
composer install
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
bin/console assets:install --symlink
chown -R www-data:www-data /var/www/ol/backend/var
chown -R www-data:www-data /var/www/ol/backend/app/uploads
apache2-foreground