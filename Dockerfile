# spécifie l'image de base
FROM python:3.9-slim-buster

# définit le répertoire de travail
WORKDIR /app

# copie les fichiers de l'application dans le conteneur
COPY requirements.txt .
COPY app.py .

# installe les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# expose le port utilisé par l'application
EXPOSE 5000

# définit la commande pour démarrer l'application
CMD [ "python", "app.py" ]

