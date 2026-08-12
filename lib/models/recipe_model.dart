class Recipe {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final int prepTime;
  final int cookTime;
  final List<String> ingredients;
  final List<String> instructions;
  final double rating;
  final int reviews;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.prepTime,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
    required this.rating,
    required this.reviews,
  });

  // Sample data with online images (Unsplash)
  static List<Recipe> sampleRecipes = [
    Recipe(
      id: 1,
      title: 'Spaghetti Carbonara',
      description: 'Classic Italian pasta with eggs, cheese, pancetta, and black pepper. A creamy, comforting dish that\'s ready in minutes.',
      imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=600&h=400&fit=crop',
      category: 'Italian',
      prepTime: 10,
      cookTime: 15,
      ingredients: ['400g Spaghetti', '4 Eggs', '100g Pecorino Romano', '150g Pancetta', 'Black Pepper'],
      instructions: [
        'Bring a large pot of salted water to boil',
        'Cook spaghetti according to package instructions',
        'In a bowl, whisk eggs and grated cheese',
        'Fry pancetta until crispy and golden',
        'Combine pasta with egg mixture and pancetta',
        'Season with black pepper and serve immediately',
      ],
      rating: 4.8,
      reviews: 1234,
    ),
    Recipe(
      id: 2,
      title: 'Chicken Tikka Masala',
      description: 'Grilled chicken in a creamy tomato and spiced sauce. A British-Indian classic loved worldwide.',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b5c4f0cccf2e?w=600&h=400&fit=crop',
      category: 'Indian',
      prepTime: 30,
      cookTime: 40,
      ingredients: ['500g Chicken Breast', '200g Yogurt', '400g Tomato Puree', '100ml Cream', 'Garam Masala'],
      instructions: [
        'Marinate chicken in yogurt and spices for 2 hours',
        'Grill chicken until cooked through',
        'Prepare sauce with tomato puree and cream',
        'Add grilled chicken to the sauce',
        'Simmer for 15 minutes',
        'Garnish with fresh coriander',
      ],
      rating: 4.6,
      reviews: 876,
    ),
    Recipe(
      id: 3,
      title: 'Sushi Rolls',
      description: 'Fresh sushi rolls with rice, nori, and various fillings. A taste of Japan in every bite.',
      imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=600&h=400&fit=crop',
      category: 'Japanese',
      prepTime: 45,
      cookTime: 0,
      ingredients: ['Sushi Rice', 'Nori Sheets', 'Fresh Salmon', 'Avocado', 'Cucumber'],
      instructions: [
        'Cook sushi rice and season with rice vinegar',
        'Place nori sheet on bamboo mat',
        'Spread rice evenly on nori',
        'Add filling ingredients in a line',
        'Roll tightly using the bamboo mat',
        'Slice into 8 pieces and serve with soy sauce',
      ],
      rating: 4.9,
      reviews: 2156,
    ),
    Recipe(
      id: 4,
      title: 'Mushroom Risotto',
      description: 'Creamy Italian rice with mushrooms and parmesan. The ultimate comfort food.',
      imageUrl: 'https://images.unsplash.com/photo-1633964913296-0aef6f5b3e75?w=600&h=400&fit=crop',
      category: 'Italian',
      prepTime: 15,
      cookTime: 35,
      ingredients: ['300g Arborio Rice', '400g Mushrooms', '1L Vegetable Stock', '1 Onion', '100g Parmesan'],
      instructions: [
        'Sauté onions and mushrooms until soft',
        'Add rice and toast for 2 minutes',
        'Gradually add stock while stirring constantly',
        'Continue until rice is creamy and tender',
        'Finish with grated parmesan cheese',
        'Rest for 5 minutes before serving',
      ],
      rating: 4.5,
      reviews: 654,
    ),
    Recipe(
      id: 5,
      title: 'Tacos al Pastor',
      description: 'Mexican tacos with marinated pork and pineapple. A street food favorite.',
      imageUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=600&h=400&fit=crop',
      category: 'Mexican',
      prepTime: 30,
      cookTime: 20,
      ingredients: ['500g Pork Shoulder', '1 Pineapple', 'Corn Tortillas', 'Fresh Cilantro', 'Lime'],
      instructions: [
        'Marinate pork in adobo sauce overnight',
        'Grill pork and pineapple until caramelized',
        'Warm tortillas on a griddle',
        'Slice meat and assemble tacos',
        'Top with fresh cilantro and lime juice',
        'Serve with salsa verde',
      ],
      rating: 4.7,
      reviews: 1543,
    ),
    Recipe(
      id: 6,
      title: 'Pad Thai',
      description: 'Stir-fried rice noodles with eggs, tofu, and bean sprouts. Thailand\'s national dish.',
      imageUrl: 'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600&h=400&fit=crop',
      category: 'Thai',
      prepTime: 20,
      cookTime: 15,
      ingredients: ['200g Rice Noodles', '2 Eggs', '200g Tofu', 'Bean Sprouts', 'Tamarind Sauce'],
      instructions: [
        'Soak rice noodles in warm water for 20 minutes',
        'Stir-fry tofu and eggs in a wok',
        'Add noodles and tamarind sauce',
        'Toss with bean sprouts and green onions',
        'Serve with lime wedges and crushed peanuts',
        'Add chili flakes to taste',
      ],
      rating: 4.4,
      reviews: 987,
    ),
  ];
}