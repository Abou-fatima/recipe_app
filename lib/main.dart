import 'package:flutter/material.dart';
import 'package:recipe_app/config/app_router.dart';
import 'package:recipe_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/recipe_provider.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child: MaterialApp.router(
        title: 'Recipe App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}