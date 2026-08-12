import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/screens/add_recipe_screen.dart';

void main() {
  testWidgets('AddRecipe shows validation errors when fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => RecipeProvider(),
          child: const AddRecipeScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Tap the Add button to trigger validation
    await tester.tap(find.text('Add Recipe'));
    await tester.pump();

    expect(find.text('Please enter a title'), findsOneWidget);
    expect(find.text('Please enter a description'), findsOneWidget);
    expect(find.text('Please enter a category'), findsOneWidget);
  });
}
