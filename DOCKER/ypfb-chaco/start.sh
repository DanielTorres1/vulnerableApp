#!/bin/bash

# Iniciar Apache
service apache2 start

# Instalar y configurar Wordpress
wp config create  --dbname wordpress --dbuser root --allow-root
wp core install --url="http://127.0.0.1" --title="YPFB Chaco" --admin_user=admin --admin_password=admin --admin_email=foo@bar.com --allow-root
wp plugin install all-in-one-wp-security-and-firewall --version=5.1.9 --activate --allow-root
wp plugin install contact-form-7 --version=5.6.4 --activate --allow-root
wp plugin install duplicate-page --version=4.5.1 --activate --allow-root
wp plugin install feed file-manager --version=6.2 --activate --allow-root
wp plugin install pdf-viewer --version=1.0.1 --activate --allow-root
wp plugin install smart-recent-posts-widget --version=1.0.2 --activate --allow-root
wp plugin install sp-news-and-widget --version=4.7.1 --activate --allow-root
wp plugin install vanilla-pdf-embed --version=0.0.8 --activate --allow-root
wp plugin install woocommerce --version=7.4.1 --activate --allow-root
wp plugin install yikes-inc-easy-mailchimp-extender --version=6.8.8 --activate --allow-root
wp theme install pisces --version=1.0.7 --activate --allow-root
wp plugin install allmigration --version=7.75 --activate --allow-root

# Mantener el contenedor en ejecución
tail -f /dev/null
