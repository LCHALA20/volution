# Vérifier la présence de fichiers de verrouillage
echo "🔍 Vérification des fichiers de verrouillage..."
if [ -f package-lock.json ]; then
    echo "🗑 Suppression de package-lock.json..."
    rm package-lock.json
fi

if [ -f yarn.lock ]; then
    echo "🗑 Suppression de yarn.lock..."
    rm yarn.lock
fi

# Définir npm comme gestionnaire de package par défaut
echo "🔧 Configuration de npm comme gestionnaire de package..."
npm config set packageManager npm

# Réinstaller les dépendances avec npm
echo "📦 Réinstallation des dépendances..."
npm install

echo "✅ Configuration terminée !"
