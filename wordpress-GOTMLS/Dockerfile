# Utiliza la imagen oficial de WordPress
FROM wordpress:latest

# Instalar unzip
RUN apt-get update && apt-get install -y unzip

# Descarga y activa la versión específica del plugin GOTMLS
RUN curl -o /usr/src/wordpress/wp-content/plugins/gotmls.zip -L https://downloads.wordpress.org/plugin/gotmls.4.21.96.zip && \
    unzip /usr/src/wordpress/wp-content/plugins/gotmls.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    rm /usr/src/wordpress/wp-content/plugins/gotmls.zip

# Establece el punto de entrada
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
