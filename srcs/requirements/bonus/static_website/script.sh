#!/bin/sh
#mkdir -p /home/$USERNAME_SESSION/data/static_website/.
#echo "ls user"
#ls /usr/share/nginx/html/* 
#echo "ls user done"
#echo "before copying"
#cp -r /usr/share/nginx/html/* /home/$USERNAME_SESSION/data/static_website/.
#echo "doing ls\n"
#ls /home/$USERNAME_SESSION/data/static_website/
#echo "ls done"
set -e

# Chemin de destination sur l'hôte
DEST="/home/$USERNAME_SESSION/data/static_website"

# Vérifier si le dossier est vide (pour éviter d'écraser des fichiers existants)
if [ ! "$(ls -A $DEST 2>/dev/null)" ]; then
    echo "📂 Copie des fichiers statiques dans $DEST..."
    cp -r /usr/share/nginx/html/* "$DEST"
fi

# Démarrer Nginx
exec nginx -g "daemon off;"
