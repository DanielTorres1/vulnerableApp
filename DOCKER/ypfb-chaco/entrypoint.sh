#!/bin/bash
set -e

# wait for MySQL
until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    sleep 1
done

# install WordPress
if ! $(wp core is-installed --allow-root); then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
    wp core install --url="http://localhost" --title="YPFB Chaco" --admin_user=admin --admin_password=admin --admin_email=foo@bar.com --allow-root
    # install plugins
    # ...
fi

# start Apache
exec apache2-foreground

