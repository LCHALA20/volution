#!/bin/bash

echo "🚀 Initialisation du backend de CVolution..."

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null
then
    echo "⚠️ Node.js n'est pas installé. Installation en cours..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Vérifier si npm est installé
if ! command -v npm &> /dev/null
then
    echo "⚠️ npm n'est pas installé. Installation en cours..."
    sudo apt install -y npm
fi

# Installer les dépendances
echo "📦 Installation des dépendances..."
npm install

# Vérifier si dotenv est installé pour gérer les variables d’environnement
if ! npm list dotenv &> /dev/null
then
    echo "⚠️ dotenv n'est pas installé. Installation en cours..."
    npm install dotenv
fi

# Vérifier si Prisma est installé pour la gestion de la base de données
if ! npm list prisma &> /dev/null
then
    echo "⚠️ Prisma n'est pas installé. Installation en cours..."
    npm install @prisma/client
    npx prisma generate
fi

# Lancer le serveur en mode développement
echo "🚀 Démarrage du backend..."
npm run dev

echo "✅ Backend lancé avec succès !"
