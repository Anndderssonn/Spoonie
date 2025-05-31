import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/domain/enums/filters.dart';
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
  Future<List<Meal>> getMealsBy(
    String categoryID,
    Map<Filters, bool> filters,
  ) async {
    final dummyLocalMeals = await getMealsFromLocalData();
    final List<Meal> meals =
        dummyLocalMeals.data
            .where((meal) => _mealPassesFilters(meal, categoryID, filters))
            .map(MealMapper.localDummyMealToEntity)
            .toList();
    return meals;
  }

  @override
  Future<Meal> getMealBy(String mealID) async {
    final dummyLocalMeals = await getMealsFromLocalData();
    final Meal meal = MealMapper.localDummyMealToEntity(
      dummyLocalMeals.data.firstWhere((meal) => meal.id == mealID),
    );
    return meal;
  }

  bool _mealPassesFilters(
    MealDatum meal,
    String categoryID,
    Map<Filters, bool> filters,
  ) {
    if (!meal.categories.contains(categoryID)) return false;
    if (filters.values.every((active) => active == false)) return true;
    if ((filters[Filters.glutenFree] ?? false) && !meal.isGlutenFree) {
      return false;
    }
    if ((filters[Filters.lactoseFree] ?? false) && !meal.isLactoseFree) {
      return false;
    }
    if ((filters[Filters.vegetarian] ?? false) && !meal.isVegetarian) {
      return false;
    }
    if ((filters[Filters.vegan] ?? false) && !meal.isVegan) {
      return false;
    }
    return true;
  }
}
