# Dockerfile
FROM wordpress:latest

# Install required packages
RUN apt-get update \
    && apt-get install -y wget unzip default-mysql-client wget \
    && rm -rf /var/lib/apt/lists/*
    
# Instalar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# Download and unzip specific version of Wordpress
RUN rm -rf /var/www/html/* \
    && wget https://wordpress.org/wordpress-5.9.7.zip \
    && unzip wordpress-5.9.7.zip \
    && mv wordpress/* /var/www/html/ \
    && rm -rf wordpress wordpress-5.9.7.zip

# Habilitar MultiViews en Apache
RUN echo "<Directory /var/www/>\nOptions Indexes FollowSymLinks MultiViews\nAllowOverride All\nOrder allow,deny\nallow from all\n</Directory>" > /etc/apache2/conf-enabled/multiviews.conf

# Asegúrate de que /usr/local/bin esté en el PATH
ENV PATH="/usr/local/bin:${PATH}"

# Agregar script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]



