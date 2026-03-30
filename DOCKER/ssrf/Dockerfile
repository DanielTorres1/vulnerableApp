FROM php:7.4-apache

# Copiar los archivos de la aplicación PHP al directorio de documentos raíz del servidor web Apache
COPY ssrf.php /var/www/html/
COPY ssrf-blind.php /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]

