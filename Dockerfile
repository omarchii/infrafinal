# Imagen base de Python
FROM python:3.9-slim

# Configurar el directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Instalar las dependencias
RUN pip install -r requirements.txt

# Exponer el puerto que usa Flask
EXPOSE 5000

# Comando para iniciar la aplicación Flask
CMD ["python", "app.py"]
