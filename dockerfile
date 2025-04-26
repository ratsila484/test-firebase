# Utiliser l'image Python officielle
FROM python:3.12-slim

# Définir le dossier de travail
WORKDIR /app

# Copier les fichiers
COPY requirements.txt requirements.txt
COPY app.py app.py

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port 8080 (important pour Cloud Run)
EXPOSE 8080

# Commande pour lancer l'application
CMD ["gunicorn", "-b", ":8080", "app:app"]
