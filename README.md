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

## Rapport d'auto-évaluation (utilisez ceci pour la soumission)

Score attendu: 70/100 (objectif)

- Fonctionnalités requises:
	- 4 écrans distincts: [OK] `Splash`, `Home`, `RecipeList`, `RecipeDetail`, `AddRecipe`
	- Navigation via `GoRouter`: [OK]
	- Liste avec recherche/filtrage: [Partial] `search_bar` present; improve filtering logic
	- Détail avec passage de paramètres: [OK]
	- Formulaire avec validation: [Partial] form exists — add validators for 3+ fields
	- Light/Dark theme: [OK]

- Technique:
	- Utilise ListView, GridView, Card, etc.: [OK]
	- 3 widgets réutilisables dans `lib/widgets/`: [OK]
	- Responsive: [Partial] needs tablet layout verification
	- UI/data separation: [OK]

## Captures d'écran (à remplacer)

1. Home screen - `screenshots/home.png`
2. Recipe list - `screenshots/list.png`
3. Recipe detail - `screenshots/detail.png`
4. Add recipe form - `screenshots/add.png`

Placez les images dans le dossier `screenshots/` et poussez le repo public.

---

Si vous voulez, je peux préparer automatiquement:

- des tests widget supplémentaires pour `RecipeList` et `AddRecipe`.
- une PR branchée avec persistance `shared_preferences` et validations.
- captures d'écran automatisées via `flutter drive` (si nécessaire).

Dites-moi quelle option vous préférez et je l'implémente.
