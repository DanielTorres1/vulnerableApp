# Usar una imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Actualizar repositorios e instalar OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server

# Configurar SSH
RUN mkdir /var/run/sshd

# Cambiar la contraseña del root (opcional, para fines de prueba)
RUN echo 'root:password' | chpasswd

# Permitir el acceso por root (opcional, no recomendado para producción)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Exponer el puerto 22
EXPOSE 22

# Iniciar el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]
