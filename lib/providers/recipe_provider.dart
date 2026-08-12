import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _recipes = SampleRecipes.recipes;
  final List<Recipe> _favorites = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Recipe> get recipes => _recipes;
  List<Recipe> get favorites => _favorites;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<Recipe> get filteredRecipes {
    var filtered = _recipes;

    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((recipe) => recipe.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((recipe) =>
              recipe.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              recipe.description
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final index = _recipes.indexWhere((recipe) => recipe.id == id);
    if (index != -1) {
      final recipe = _recipes[index];
      _recipes[index] = recipe.copyWith(isFavorite: !recipe.isFavorite);

      if (_recipes[index].isFavorite) {
        _favorites.add(_recipes[index]);
      } else {
        _favorites.removeWhere((fav) => fav.id == id);
      }

      notifyListeners();
    }
  }

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedCategory = 'All';
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _favorites.any((recipe) => recipe.id == id);
  }
}
