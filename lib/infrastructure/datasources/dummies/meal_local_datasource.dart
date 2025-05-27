import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/mappers/mappers.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class MealLocalDatasource implements MealsDatasource {
  Future<MealsDummy> getMealsFromLocalData() async {
    final String mealDummyResponse = await rootBundle.loadString(
      'assets/meals_dummy.json',
    );
    final Map<String, dynamic> mealsDummyData = jsonDecode(mealDummyResponse);
    return MealsDummy.fromJson(mealsDummyData);
  }

  @override
  Future<List<Meal>> getMealByCategory(String categoryID) async {
    final dummyLocalMeals = await getMealsFromLocalData();
    final List<Meal> meals =
        dummyLocalMeals.data
            .where((meal) => meal.categories.contains(categoryID))
            .map((meal) => MealMapper.localDummyMealToEntity(meal))
            .toList();
    return meals;
  }

  @override
  Future<Meal> getMealByID(String mealID) async {
    final dummyLocalMeals = await getMealsFromLocalData();
    final Meal meal = MealMapper.localDummyMealToEntity(
      dummyLocalMeals.data.firstWhere((meal) => meal.id == mealID),
    );
    return meal;
  }
}
