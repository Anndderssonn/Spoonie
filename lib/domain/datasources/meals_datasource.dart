import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/domain/enums/enums.dart';

abstract class MealsDatasource {
  Future<List<Meal>> getMealsBy(String categoryID, Map<Filters, bool> filters);
  Future<Meal> getMealBy(String mealID);
}
