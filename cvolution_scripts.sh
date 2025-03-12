#!/bin/bash

# Script principal pour initialiser et configurer l'environnement de CVolution

echo "🚀 Début de l'installation et configuration de CVolution"

# 1. Initialisation du Backend
echo "🔧 Initialisation du backend..."
bash init_backend.sh

# 2. Configuration de la base de données
echo "🛠️ Configuration et migration de la base de données..."
bash db_setup.sh

# 3. Mise en place de l'API Utilisateurs
echo "📡 Configuration des API utilisateurs..."
bash api_users.sh

# 4. Déploiement CI/CD
echo "🚀 Mise en place du pipeline de déploiement..."
bash deploy_ci_cd.sh

# 5. Génération des pages UX/UI
echo "🎨 Génération automatique des pages..."
bash generate_pages.sh

# 6. Ajout du système de notifications
echo "🔔 Configuration des notifications UI et email..."
bash notifications.sh

# 7. Intégration du moteur de recherche
echo "🔍 Ajout du moteur de recherche avancé..."
bash search_engine.sh

# 8. Système de Matching AI
echo "🤖 Intégration du matching automatique des candidatures..."
bash matching_ai.sh

# 9. Mise à jour des dépendances
echo "📦 Mise à jour des dépendances..."
bash update_dependencies.sh

# 10. Exécution des tests
echo "✅ Lancement des tests et vérifications de conformité..."
bash run_tests.sh

# 11. Surveillance des logs
echo "📊 Activation du monitoring des logs..."
bash logs_monitoring.sh

# 12. Activation de l'assistant AI
echo "🧠 Activation de l'assistant AI pour les recruteurs..."
bash ai_assistant.sh

echo "🎉 Configuration terminée ! CVolution est prêt à être utilisé. 🚀"
