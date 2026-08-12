import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/providers/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _prepTimeController.dispose();
    _cookTimeController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      try {
        final recipe = Recipe(
          id: DateTime.now().millisecondsSinceEpoch,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&h=400&fit=crop',
          category: _categoryController.text.trim(),
          prepTime: int.parse(_prepTimeController.text),
          cookTime: int.parse(_cookTimeController.text),
          ingredients: _ingredientsController.text.split(',').map((e) => e.trim()).toList(),
          instructions: _instructionsController.text.split('\n').where((e) => e.trim().isNotEmpty).toList(),
          rating: 0.0,
          reviews: 0,
        );

        context.read<RecipeProvider>().addRecipe(recipe);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Recipe added successfully! 🎉'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          await Future.delayed(const Duration(milliseconds: 500));
          if (mounted) {
            context.go('/recipes');
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('❌ Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isSubmitting = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Recipe'),
        actions: [
          IconButton(
            icon: _isSubmitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save),
            onPressed: _isSubmitting ? null : _submitForm,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildTextField(
                controller: _titleController,
                label: 'Recipe Title',
                icon: Icons.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  if (value.length < 3) {
                    return 'Title must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _descriptionController,
                label: 'Description',
                icon: Icons.description,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  if (value.length < 10) {
                    return 'Description must be at least 10 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _categoryController,
                label: 'Category',
                icon: Icons.category,
                hint: 'e.g., Italian, Indian, Japanese',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _prepTimeController,
                      label: 'Prep Time (min)',
                      icon: Icons.timer,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        final number = int.tryParse(value);
                        if (number == null) {
                          return 'Enter a valid number';
                        }
                        if (number < 0) {
                          return 'Must be positive';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _cookTimeController,
                      label: 'Cook Time (min)',
                      icon: Icons.timer_off,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        final number = int.tryParse(value);
                        if (number == null) {
                          return 'Enter a valid number';
                        }
                        if (number < 0) {
                          return 'Must be positive';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _ingredientsController,
                label: 'Ingredients',
                icon: Icons.list,
                hint: 'Separate with commas, e.g., Pasta, Eggs, Cheese',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one ingredient';
                  }
                  final ingredients = value.split(',').where((e) => e.trim().isNotEmpty).toList();
                  if (ingredients.length < 2) {
                    return 'Enter at least 2 ingredients';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _instructionsController,
                label: 'Instructions',
                icon: Icons.format_list_numbered,
                hint: 'Enter each step on a new line',
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter instructions';
                  }
                  final lines = value.split('\n').where((e) => e.trim().isNotEmpty).toList();
                  if (lines.length < 2) {
                    return 'Enter at least 2 steps';
                  }
                  if (value.length < 20) {
                    return 'Instructions must be at least 20 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _submitForm,
                  icon: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save),
                  label: Text(
                    _isSubmitting ? 'Adding...' : 'Add Recipe',
                    style: const TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '$label *',
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}