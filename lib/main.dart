import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/recipe_list_screen.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';
import 'package:recipe_app/screens/add_recipe_screen.dart';
import 'package:recipe_app/screens/splash_screen.dart';
import 'package:recipe_app/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  static final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/recipes',
        name: 'recipes',
        builder: (context, state) => const RecipeListScreen(),
      ),
      GoRoute(
        path: '/recipe/:id',
        name: 'recipe_detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '0';
          return RecipeDetailScreen(recipeId: int.parse(id));
        },
      ),
      GoRoute(
        path: '/add-recipe',
        name: 'add_recipe',
        builder: (context, state) => const AddRecipeScreen(),
      ),
    ],
  );
}