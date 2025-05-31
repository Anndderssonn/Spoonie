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
            .where((meal) {
              if (meal.categories.contains(categoryID)) {
                if (!filters[Filters.glutenFree]! &&
                    !filters[Filters.lactoseFree]! &&
                    !filters[Filters.vegetarian]! &&
                    !filters[Filters.vegan]!) {
                  return true;
                }
                if (filters[Filters.glutenFree]! && !meal.isGlutenFree) {
                  return false;
                }
                if (filters[Filters.lactoseFree]! && !meal.isLactoseFree) {
                  return false;
                }
                if (filters[Filters.vegetarian]! && !meal.isVegetarian) {
                  return false;
                }
                if (filters[Filters.vegan]! && !meal.isVegan) {
                  return false;
                }
                return true;
              }
              return false;
            })
            .map((meal) => MealMapper.localDummyMealToEntity(meal))
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
}
