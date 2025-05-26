import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/mappers/mappers.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class MealLocalDatasource implements MealsDatasource {
  @override
  Future<List<Meal>> getMealByCategory(String categoryID) async {
    await Future.delayed(const Duration(seconds: 1));
    final String mealDummyResponse = await rootBundle.loadString(
      'assets/meals_dummy.json',
    );
    final Map<String, dynamic> mealsDummyData = jsonDecode(mealDummyResponse);
    final dummyLocalMeals = MealsDummy.fromJson(mealsDummyData);
    final List<Meal> meals =
        dummyLocalMeals.data
            .where((meal) => meal.categories.contains(categoryID))
            .map((meal) => MealMapper.localDummyMealToEntity(meal))
            .toList();
    return meals;
  }
}
