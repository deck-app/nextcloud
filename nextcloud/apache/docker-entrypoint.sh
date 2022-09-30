#!/bin/bash

set +x
if [ -e index.php ] && [ -d "/var/www/apps" ] && [ -e version.php ]
then
    cd /var/www/
    echo >&2 "NextCloud found in $(pwd)"
else  
    cd /var/www
    echo >&2 "NextCloud not found in $(pwd) - Create apps please patience..."
    Sudo tar cf - --one-file-system -C /app/nextcloud/ . | tar xf -
fi

sudo rm -rf /var/preview
sudo cp /app/httpd.conf /etc/apache2/httpd.conf
# for i in `lsof -i :80 | grep http | awk {'print $2'}`; do kill -9 $i; done
# for i in `ipcs -s | grep apache | awk '{print $2}'`; do ipcrm -s $i; done
httpd -k graceful
sudo chown -R apache:apache /var/www 2> /dev/null
exec "$@"