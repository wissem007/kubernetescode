# Spécifie l'image de base
FROM python:3.9-slim-buster

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de l'application dans le conteneur
COPY requirements.txt .
COPY app.py .
#COPY Jenkins.png .

# Installe les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Expose le port utilisé par l'application
EXPOSE 5000

# Définit la commande pour démarrer l'application
CMD [ "python", "app.py" ]
