# Usa la imagen oficial de Katalon
FROM katalonstudio/katalon:latest

# Instala Python
RUN apt-get update && apt-get install -y python3 python3-pip

# Define el directorio de trabajo dentro del contenedor
WORKDIR /katalon/katalon/source

# Copia el contenido del proyecto
COPY . .

# Asegúrate de que el script entrypoint.sh sea ejecutable
RUN chmod +x /katalon/katalon/source/entrypoint.sh

# Usa entrypoint.sh como punto de entrada
ENTRYPOINT ["/bin/sh", "/katalon/katalon/source/entrypoint.sh"]