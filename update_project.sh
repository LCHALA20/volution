#!/bin/bash

echo "🚀 Mise à jour du projet CVolution..."

# Vérification de la connexion au dépôt GitHub
echo "🔄 Récupération des dernières modifications..."
git pull origin main

# Ajout des fichiers mis à jour
echo "✅ Ajout des fichiers mis à jour..."
git add .

# Validation automatique des modifications
echo "📝 Validation des modifications..."
git commit -m "Mise à jour automatique des dernières avancées"

# Synchronisation avec GitHub
echo "📤 Envoi des modifications sur GitHub..."
git push origin main

# Vérification et création de la page Recruteurs si absente
if [ ! -d "src/app/recruteurs" ]; then
    echo "📂 Création du dossier /recruteurs..."
    mkdir -p src/app/recruteurs
fi

if [ ! -f "src/app/recruteurs/page.tsx" ]; then
    echo "📝 Création de la page Recruteurs..."
    cat <<EOL > src/app/recruteurs/page.tsx
export default function RecruteursPage() {
    return (
        <div className="flex flex-col items-center justify-center h-screen">
            <h1 className="text-3xl font-bold">Espace Recruteur</h1>
            <p>Bienvenue sur votre espace dédié aux recruteurs.</p>
        </div>
    );
}
EOL
    git add src/app/recruteurs/page.tsx
    git commit -m "Ajout de la page Recruteurs"
    git push origin main
fi

# Redémarrage du serveur Next.js
echo "🚀 Redémarrage du serveur..."
npm run build && npm run start

echo "✅ Mise à jour terminée !"
