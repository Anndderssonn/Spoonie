import 'package:flutter/material.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/domain/enums/enums.dart';

class MealsDummy {
  final List<MealDatum> data;

  MealsDummy({required this.data});

  factory MealsDummy.fromJson(Map<String, dynamic> json) => MealsDummy(
    data: List<MealDatum>.from(json["data"].map((x) => MealDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MealDatum {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  MealDatum({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory MealDatum.fromJson(Map<String, dynamic> json) => MealDatum(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: affordabilityValues.map[json["affordability"]]!,
    complexity: complexityValues.map[json["complexity"]]!,
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoseFree: json["isLactoseFree"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "title": title,
    "affordability": affordabilityValues.reverse[affordability],
    "complexity": complexityValues.reverse[complexity],
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoseFree,
  };
}

final affordabilityValues = EnumValues<Affordability>({
  "affordable": Affordability.affordable,
  "luxurious": Affordability.luxurious,
  "pricey": Affordability.pricey,
});

final complexityValues = EnumValues<Complexity>({
  "challenging": Complexity.challenging,
  "hard": Complexity.hard,
  "simple": Complexity.simple,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final List<DietOption> dietaryOptions = [
  DietOption(label: 'Gluten Free', icon: Icons.no_food_outlined),
  DietOption(label: 'Vegan', icon: Icons.spa_outlined),
  DietOption(label: 'Vegetarian', icon: Icons.restaurant_menu_outlined),
  DietOption(label: 'Lactose Free', icon: Icons.free_breakfast_outlined),
];
