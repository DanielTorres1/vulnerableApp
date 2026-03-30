# Usar kali-rolling como base
FROM kalilinux/kali-rolling

# Actualizar el sistema y instalar nmap
RUN apt-get update && apt-get install -y nmap

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Comando por defecto
CMD ["bash"]

