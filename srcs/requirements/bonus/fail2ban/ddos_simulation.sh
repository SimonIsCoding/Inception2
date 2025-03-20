#!/bin/bash

# Nombre de requêtes à envoyer (simuler un DDoS)
NUM_REQUESTS=1000
# URL de ton site (exemple: login.42.fr)
URL="http://simarcha.42.fr"

# Utilisation de curl pour envoyer des requêtes répétées
for i in $(seq 1 $NUM_REQUESTS); do
  curl -s -o /dev/null $URL &
done

echo "$NUM_REQUESTS requêtes envoyées à $URL pour tester Fail2Ban."
