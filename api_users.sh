#!/bin/bash

echo "📡 Démarrage de la configuration de l'API Utilisateurs..."

# 1. Vérification de Node.js et NPM
if ! command -v node &> /dev/null
then
    echo "❌ Node.js n'est pas installé. Installation en cours..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - 
    sudo apt-get install -y nodejs
else
    echo "✅ Node.js est installé."
fi

# 2. Installation des dépendances nécessaires
echo "📦 Installation des dépendances de l'API..."
cd src/api/users || { echo "❌ Erreur : dossier API non trouvé"; exit 1; }
npm install || { echo "❌ Échec de l'installation des dépendances"; exit 1; }

# 3. Vérification et application des migrations Prisma
if [ -f "../../prisma/schema.prisma" ]; then
    echo "🛠️ Application des migrations Prisma..."
    npx prisma generate
    npx prisma migrate dev --name init_users
else
    echo "⚠️ Aucun fichier Prisma trouvé. Skipping migrations."
fi

# 4. Vérification et application des variables d'environnement
if [ -f "../../.env" ]; then
    echo "✅ Fichier .env trouvé."
else
    echo "⚠️ Fichier .env manquant, création d'un modèle..."
    cat <<EOT >> ../../.env
DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
PORT=4000
JWT_SECRET="your_secret_key"
EOT
fi

# 5. Démarrage de l'API utilisateurs
echo "🚀 Lancement de l'API Utilisateurs..."
npm run dev || { echo "❌ Échec du démarrage de l'API Utilisateurs"; exit 1; }

echo "🎉 API Utilisateurs configurée et en cours d'exécution sur http://localhost:4000"
