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
