FROM ubuntu:22.04

# Configure package sources
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Update package list and install necessary packages
RUN apt update && \
    apt install -y tzdata && \
    apt install -y nginx php-fpm

# Downgrading libc to a vulnerable version with explicit downgrade permission
RUN apt install -y --allow-downgrades libc6-dev=2.35-0ubuntu3 libc-dev-bin=2.35-0ubuntu3 libc6=2.35-0ubuntu3

# Copy configuration files
COPY index.php /var/www/html/index.php
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY start.sh /start.sh

# Ensure the start script is executable
RUN chmod +x /start.sh

# Set the default command to run the start script
CMD ["./start.sh"]
