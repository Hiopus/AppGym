# AppGym 🏋️

Application web personnelle de suivi de musculation. Un seul fichier `index.html`,
sans framework ni dépendance. Données stockées sur Supabase, installable sur
mobile (PWA), thème sombre industriel.

## Mise en route (une seule fois)

### 1. Préparer la base de données Supabase
1. Ouvrez votre projet sur [supabase.com](https://supabase.com)
2. Menu de gauche → **SQL Editor** → **New query**
3. Copiez-collez tout le contenu du fichier [`supabase.sql`](supabase.sql)
4. Cliquez sur **Run** — c'est terminé, les 3 tables sont créées

### 2. Connecter l'application
1. Dans Supabase : **Settings → API**
2. Copiez l'**URL** du projet (ex : `https://xxxx.supabase.co`) et la clé **anon public**
3. Ouvrez l'application → onglet **Réglages** → collez les deux → **Enregistrer et tester**

Ces informations restent uniquement dans votre navigateur (localStorage),
elles ne sont jamais publiées sur GitHub.

### 3. Installer sur votre téléphone
1. Ouvrez l'URL de l'app dans Chrome (Android) ou Safari (iPhone)
2. Menu du navigateur → **Ajouter à l'écran d'accueil**
3. L'app s'ouvre désormais en plein écran, comme une vraie application

## Fonctionnalités
- Séances nommées (Push, Pull, Jambes…) avec date et note libre
- Exercices avec autocomplétion (45 exercices classiques en français) + saisie libre
- Séries : répétitions × charge (kg), pré-remplies avec la dernière fois
- **Reprendre** : duplique la dernière séance du même nom en un tap
- Rappel « dernière fois » avec indicateur de progression ▲/▼
- Records personnels (PR) et graphique SVG d'évolution par exercice
- Compteur de séances sur les 30 derniers jours
- Chrono de repos : 1:30 / 2:00 / 3:00 avec bip et vibration
- Export / import JSON en sauvegarde de secours (onglet Réglages)

## Fichiers
| Fichier | Rôle |
|---|---|
| `index.html` | Toute l'application (HTML + CSS + JavaScript) |
| `supabase.sql` | Script de création des tables (à exécuter une fois) |
| `manifest.json` | Description de la PWA pour l'installation mobile |
| `sw.js` | Service worker (cache « réseau d'abord ») |
| `icon-192.png` / `icon-512.png` | Icônes de l'application |
