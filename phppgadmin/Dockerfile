# Dockerfile for phpPgAdmin with PHP and PostgreSQL support
FROM php:7.4-apache

# Install dependencies and PostgreSQL client
RUN apt-get update && \
    apt-get install -y wget unzip libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql pgsql

# Download and install phpPgAdmin
RUN wget -O phpPgAdmin.tar.gz https://github.com/phppgadmin/phppgadmin/archive/REL_5-1-0.tar.gz && \
    tar xvzf phpPgAdmin.tar.gz && \
    rm phpPgAdmin.tar.gz && \
    mv phppgadmin-REL_5-1-0 /var/www/html/phppgadmin && \
    chown -R www-data:www-data /var/www/html/phppgadmin

# Copy and configure phpPgAdmin
COPY config.inc.php /var/www/html/phppgadmin/conf/config.inc.php

# Configure Apache
RUN echo "Alias /phppgadmin /var/www/html/phppgadmin" > /etc/apache2/conf-available/phppgadmin.conf && \
    echo "<Directory /var/www/html/phppgadmin/>" >> /etc/apache2/conf-available/phppgadmin.conf && \
    echo "    Options FollowSymlinks" >> /etc/apache2/conf-available/phppgadmin.conf && \
    echo "    AllowOverride All" >> /etc/apache2/conf-available/phppgadmin.conf && \
    echo "</Directory>" >> /etc/apache2/conf-available/phppgadmin.conf && \
    sed -i 's/Require local/Require all granted/' /etc/apache2/conf-available/phppgadmin.conf && \
    a2enconf phppgadmin && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod session

# Ensure index.php is served by default
RUN echo "DirectoryIndex index.php" >> /etc/apache2/apache2.conf

# Fix deprecated constructor in Misc.php
RUN sed -i 's/function Misc(/function __construct(/' /var/www/html/phppgadmin/classes/Misc.php

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
