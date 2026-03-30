# Use the official MySQL 8 image from the Docker Hub
FROM mysql:8.0

# Set the environment variables for the MySQL root user
ENV MYSQL_ROOT_PASSWORD=12344321
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Expose port 3306 to be able to connect to MySQL from outside the container
EXPOSE 3306

# Use the command below if you need to run any initialization scripts
# ADD ./path_to_your_sql_scripts/ /docker-entrypoint-initdb.d/

# No additional commands are necessary as the MySQL official image already contains an entrypoint script that initializes the database
