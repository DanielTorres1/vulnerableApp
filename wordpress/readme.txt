#Asignar variables de entorno y levantar los contenedores
WORDPRESS_DB_PASSWORD=rootpassword MYSQL_ROOT_PASSWORD=rootpassword docker-compose up &

#Borrar historial para que no se que el password en el historial
history -c
