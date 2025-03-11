#!/bin/bash

echo "🚀 Démarrage de l'automatisation Git & serveur..."

# Vérifier si des modifications existent
if [ -n "$(git status --porcelain)" ]; then
  echo "📝 Ajout des fichiers modifiés..."
  git add .

  echo "✅ Commit des modifications..."
  git commit -m "🔄 Auto-commit: synchronisation automatique"

  echo "📡 Envoi vers GitHub..."
  git push origin main
else
  echo "⚠️ Aucune modification détectée, rien à commit/push."
fi

# Redémarrer le serveur Next.js
echo "🔄 Redémarrage du serveur Next.js..."
npm run dev

echo "✅ Tout est synchronisé et le serveur est actif !"
