const express = require('express');
const app = express();
const PORT = 3000;

// Servir les fichiers statiques depuis le dossier "public"
app.use(express.static('public'));

app.use('/static_website', express.static('public'));

app.listen(PORT, () => {
    console.log(`Serveur en écoute sur http://localhost:${PORT}`);
});
