#!/bin/bash

echo "🚀 Initialisation et configuration de la base de données Prisma..."

# 📌 Définir le type de base de données (choisir entre 'postgresql', 'mysql', 'mongodb')
DB_TYPE="postgresql"  # Modifier selon le besoin : postgresql, mysql ou mongodb

# Vérifier si Prisma est installé
if ! command -v prisma &> /dev/null
then
    echo "⚠️ Prisma n'est pas installé. Installation en cours..."
    npm install -g prisma
fi

# Vérifier si le dossier Prisma existe
if [ ! -d "prisma" ]; then
    echo "📂 Création du dossier Prisma..."
    npx prisma init
fi

# Vérifier si le fichier schema.prisma existe
if [ ! -f "prisma/schema.prisma" ]; then
    echo "📜 Génération du fichier schema.prisma..."
    cat <<EOL > prisma/schema.prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "$DB_TYPE"
  url      = env("DATABASE_URL")
}

model User {
  id    String @id @default(uuid())
  name  String
  email String  @unique
}
EOL
fi

# Vérifier si le fichier .env existe et configurer la base de données
if [ ! -f ".env" ]; then
    echo "🔧 Création du fichier .env avec l'URL de connexion à la base de données..."

    if [ "$DB_TYPE" == "postgresql" ]; then
        echo "DATABASE_URL='postgresql://user:password@localhost:5432/volution_db'" > .env
    elif [ "$DB_TYPE" == "mysql" ]; then
        echo "DATABASE_URL='mysql://user:password@localhost:3306/volution_db'" > .env
    elif [ "$DB_TYPE" == "mongodb" ]; then
        echo "DATABASE_URL='mongodb+srv://user:password@cluster.mongodb.net/volution_db'" > .env
    fi
fi

# Vérifier et installer les dépendances nécessaires
if [ ! -d "node_modules" ]; then
    echo "📦 Installation des dépendances Prisma..."
    npm install @prisma/client
fi

# Appliquer les migrations (sauf pour MongoDB, qui ne supporte pas les migrations Prisma)
if [ "$DB_TYPE" != "mongodb" ]; then
    echo "📊 Migration de la base de données..."
    npx prisma migrate dev --name init
else
    echo "⚠️ Les migrations ne sont pas supportées avec MongoDB. Vérifie les modèles manuellement."
fi

echo "✅ Configuration terminée !"
