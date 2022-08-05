#!/bin/bash

set +x
if [ -e index.php ] && [ -d "/var/www/apps" ] && [ -e version.php ]
then
    cd /var/www/
    echo >&2 "NextCloud found in $(pwd)"
else  
    cd /var/www
    echo >&2 "NextCloud not found in $(pwd) - Create apps please patience..."
    tar cf - --one-file-system -C /app/nextcloud/ . | tar xf -
fi

sudo cp /app/default.conf /etc/nginx/conf.d/default.conf
nginx -s reload
sudo chown -R nobody:nobody /var/www 2> /dev/null

sudo rm -rf /var/preview
sudo rm -rf /app/default.conf
exec "$@"