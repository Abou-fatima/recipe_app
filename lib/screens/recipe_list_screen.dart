import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import 'package:recipe_app/widgets/recipe_card_list.dart';
import 'package:recipe_app/widgets/search_bar.dart';
import 'package:recipe_app/widgets/category_chip.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            tooltip: _isGridView ? 'Switch to list' : 'Switch to grid',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/add-recipe'),
            tooltip: 'Add recipe',
          ),
        ],
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          final recipes = provider.filteredRecipes;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomSearchBar(
                  initialValue: provider.searchQuery,
                  onSearch: provider.setSearchQuery,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: RecipeCategory.categories.length,
                    itemBuilder: (context, index) {
                      final category = RecipeCategory.categories[index];
                      return CategoryChip(
                        label: category,
                        isSelected: provider.selectedCategory == category,
                        onSelected: () => provider.setCategory(category),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${recipes.length} recipes found',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (provider.searchQuery.isNotEmpty ||
                        provider.selectedCategory != 'All')
                      TextButton(
                        onPressed: provider.clearFilters,
                        child: const Text('Clear Filters'),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: recipes.isEmpty
                    ? const _EmptyState()
                    : _isGridView
                        ? _GridViewBuilder(recipes: recipes)
                        : _ListViewBuilder(recipes: recipes),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No recipes found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.push('/add-recipe'),
            icon: const Icon(Icons.add),
            label: const Text('Add New Recipe'),
          ),
        ],
      ),
    );
  }
}

class _GridViewBuilder extends StatelessWidget {
  final List<Recipe> recipes;

  const _GridViewBuilder({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  final List<Recipe> recipes;

  const _ListViewBuilder({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RecipeCardList(recipe: recipes[index]),
        );
      },
    );
  }
}