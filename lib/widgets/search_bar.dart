import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? initialValue;
  final Function(String) onSearch;

  const CustomSearchBar({
    super.key,
    this.initialValue,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: 'Search recipes...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            onSearch('');
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
      ),
      onChanged: onSearch,
    );
  }
}
