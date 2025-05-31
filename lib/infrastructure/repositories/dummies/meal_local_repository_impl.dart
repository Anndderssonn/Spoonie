import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/meal.dart';
import 'package:spoonie/domain/enums/enums.dart';

class MealLocalRepositoryImpl implements MealsDatasource {
  final MealsDatasource mealsDatasource;

  MealLocalRepositoryImpl({required this.mealsDatasource});

  @override
  Future<List<Meal>> getMealsBy(String categoryID, Map<Filters, bool> filters) {
    return mealsDatasource.getMealsBy(categoryID, filters);
  }

  @override
  Future<Meal> getMealBy(String mealID) {
    return mealsDatasource.getMealBy(mealID);
  }
}
