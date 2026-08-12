import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/screens/splash_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/recipe_list_screen.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';
import 'package:recipe_app/screens/add_recipe_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String home = '/';
  static const String recipes = '/recipes';
  static const String recipeDetail = '/recipe/:id';
  static const String addRecipe = '/add-recipe';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'recipes',
            name: 'recipes',
            builder: (context, state) => const RecipeListScreen(),
          ),
          GoRoute(
            path: 'recipe/:id',
            name: 'recipeDetail',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id'] ?? '0');
              return RecipeDetailScreen(recipeId: id);
            },
          ),
          GoRoute(
            path: 'add-recipe',
            name: 'addRecipe',
            builder: (context, state) => const AddRecipeScreen(),
          ),
        ],
      ),
    ],
  );
}