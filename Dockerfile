# Dockerfile

# Utiliser une image de base Python 3.10 Alpine
FROM python:3.10-alpine

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /code

# Définir les variables d'environnement pour Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Installer les dépendances nécessaires pour compiler les packages Python
RUN apk add --no-cache gcc musl-dev linux-headers

# Copier le fichier requirements.txt dans le conteneur
COPY requirements.txt requirements.txt

# Installer les dépendances Python à partir du fichier requirements.txt
RUN pip install -r requirements.txt

# Exposer le port sur lequel Flask s'exécute
EXPOSE 5000

# Copier tous les fichiers du dossier local dans le conteneur
COPY . .

# Commande pour exécuter l'application Flask
CMD ["flask", "run"]
