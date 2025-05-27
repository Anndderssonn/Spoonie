import 'package:flutter/material.dart';
import 'package:spoonie/config/helpers/helpers.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class CategoryMapper {
  static final Map<String, IconData> categoryIcons = {
    'c1': Icons.local_pizza,
    'c9': Icons.bakery_dining,
    'c4': Icons.restaurant,
    'c2': Icons.fastfood,
    'c3': Icons.lunch_dining,
    'c5': Icons.emoji_food_beverage,
    'c10': Icons.icecream,
    'c7': Icons.brunch_dining,
    'c8': Icons.rice_bowl,
    'c6': Icons.ramen_dining,
  };

  static IconData getCategoryIcon(String category) {
    return categoryIcons[category] ?? Icons.menu_book;
  }

  static Category localDummyCategoryToEntity(CategoryDatum category) =>
      Category(
        id: category.id,
        title: category.title,
        color: hexToColor(category.color),
        icon: getCategoryIcon(category.id),
      );
}
