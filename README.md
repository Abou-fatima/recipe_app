# Recipe App

Application Flutter multi-écrans (exercice pédagogique).

## Aperçu

Une petite application de recettes avec navigation, écrans de liste, détail et ajout de recettes.

## Exécution

Prérequis: Flutter SDK installé (stable channel).

Lancer l'app en debug sur un appareil connecté ou émulateur:

```bash
flutter pub get
flutter run
```

Analyser le projet et exécuter les tests:

```bash
flutter analyze
flutter test
```

## Points d'entrée et fichiers clés

- **Entrée de l'app**: [lib/main.dart](lib/main.dart#L1)
- **Thèmes**: [lib/theme/app_theme.dart](lib/theme/app_theme.dart#L1)
- **Modèles**: [lib/models/recipe_model.dart](lib/models/recipe_model.dart#L1)
- **Composants**: [lib/widgets/search_bar.dart](lib/widgets/search_bar.dart#L1), [lib/widgets/recipe_card.dart](lib/widgets/recipe_card.dart#L1)
- **Tests**: [test/widget_test.dart](test/widget_test.dart#L1)

## Routes

Définies dans `RecipeApp` via `GoRouter` (voir [lib/main.dart](lib/main.dart#L1)). Principales routes:

- `/splash` → écran d'accueil initial
- `/` → `HomeScreen`
- `/recipes` → `RecipeListScreen`
- `/recipe/:id` → `RecipeDetailScreen`
- `/add-recipe` → `AddRecipeScreen`

## Améliorations recommandées (pour atteindre ≥70/100)

- Ajouter persistance locale (SharedPreferences ou sqflite) pour sauvegarder recettes ajoutées.
- Couvrir les écrans critiques avec tests widget et unitaires (liste, détail, ajout, recherche).
- Ajouter validation et gestion d'erreurs sur le formulaire d'ajout.
- Vérifier l'accessibilité: labels, contrastes et support lecteur d'écran.
- Rendre l'UI responsive (tablettes / petits écrans) et tester sur plusieurs devices.
- Nettoyer les warnings d'analyse (`flutter analyze`) et corriger les types/nullable issues.

## Notes pour la soumission

- Inclure un bref rapport des tests exécutés et capture d'écran(s) montrant les principales vues.
- Documenter les limitations connues et la liste des tickets/PRs pour les améliorations.

Si vous voulez, je peux: lancer `flutter analyze` et `flutter test`, ajouter des tests manquants, ou préparer le petit rapport de soumission.

---

## Checklist de soumission (à inclure dans le dépôt)

- [ ] `README.md` avec instructions d'exécution et captures d'écran
- [ ] Démo de navigation (GIF ou images): écran liste → détail → ajout
- [ ] Tests unitaires / widget couvrant au moins les flux critiques
- [ ] Fichiers de configuration: `pubspec.yaml` mis à jour, dépendances listées
- [ ] Pas d'erreurs d'analyse (`flutter analyze`)

## Rapport d'auto-évaluation (à inclure dans la soumission)

Score visé: 70/100 (objectif de certification). Ci‑dessous la cartographie exacte entre le cahier des charges et l'état actuel du projet :

- **Écrans** (≥4) — 10 pts: `Splash`, `Home`, `RecipeList`, `RecipeDetail`, `AddRecipe` — **OK**
- **Navigation (GoRouter / routes nommées)** — 15 pts: routes et passage de paramètres implémentés (`/recipe/:id`) — **OK**
- **Liste avec recherche / filtrage** — 15 pts: `RecipeListScreen` + `search_bar` + `RecipeProvider` (filtrage basique) — **Partiel** (améliorer debounce et filtrage côté serveur non nécessaire)
- **Détail avec paramètre** — 10 pts: `RecipeDetailScreen(recipeId: ...)` — **OK**
- **Formulaire avec validation (≥3 champs)** — 15 pts: `AddRecipeScreen` valide `title`, `description`, `category`, `prepTime`, `cookTime`, `ingredients`, `instructions` — **OK**
- **Thème light/dark** — 5 pts: `lib/theme/app_theme.dart` — **OK**
- **Techniques & bonnes pratiques** — 20 pts total:
  - Utilisation d'au moins 8 widgets différents (ListView, GridView, Card, Image, Text, TextFormField, Chip, Icon...) — **OK**
  - Au moins 3 widgets réutilisables dans `lib/widgets/` — **OK**
  - Séparation UI / données (models + provider) — **OK**
  - Responsive: **Partiel** (grid fixe, améliorer pour tablettes)

> Statut global provisoire: certains points techniques (filtrage avancé, responsive tablette, persistance) restent à améliorer — voir "Prochaines étapes".

## Captures d'écran requises (à ajouter au dépôt)

1. `screenshots/home.png` — écran d'accueil
2. `screenshots/list.png` — écran liste / grille
3. `screenshots/detail.png` — page détail d'une recette
4. `screenshots/add.png` — formulaire d'ajout (montrant les messages de validation)

Placez ces images dans le dossier `screenshots/` et poussez-les sur le repo public avant soumission.

## Vérification manuelle rapide (pour le correcteur)

1. Cloner le dépôt et lancer:

```bash
flutter pub get
flutter run
```

2. Vérifier la navigation:
   - Démarrer → `Splash` puis `Home`.
   - Ouvrir `Recipes` et parcourir la grille/list.
   - Cliquer sur une carte → vérifier que l'URL `/recipe/:id` affiche le bon détail.

3. Vérifier le formulaire `Add New Recipe`:
   - Cliquer sur `Add New Recipe` → sans remplir, appuyer sur `Add Recipe` → les messages de validation apparaissent.
   - Remplir correctement et soumettre → la recette est ajoutée à la liste (en mémoire).

4. Lancer les tests et l'analyse statique:

```bash
flutter analyze
flutter test
```

## Checklist finale (à cocher pour soumission)

- [ ] Repo public GitHub (URL fournie dans le formulaire)
- [ ] `README.md` complet (instructions, vérification, captures)
- [ ] Tests : `test/widget_test.dart`, `test/add_recipe_form_test.dart` — **inclus**
- [ ] Formulaire avec validateurs (≥3 champs) — **OK**
- [ ] Navigation avec paramètres — **OK**
- [ ] Aucune erreur bloquante à `flutter analyze` (corriger warnings restants)

## Prochaines étapes recommandées (priorisées)

1. Corriger les derniers warnings d'analyse et les avis `prefer_const_constructors` (rapide).
2. Améliorer le filtrage/recherche (debounce, sensibilité, tri) — augmente l'expérience utilisateur.
3. Ajouter persistance locale (`shared_preferences` ou `sqflite`) pour sauvegarder les recettes ajoutées (important pour la note finale).
4. Ajuster le `GridView` pour qu'il soit responsive sur tablettes (`SliverGridDelegateWithMaxCrossAxisExtent` ou `LayoutBuilder`).

---

Si vous le souhaitez, je peux commencer par la tâche #1 (corriger les derniers warnings) — voulez-vous que je lance `flutter analyze` maintenant et corrige automatiquement les avertissements faciles ?
