import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/meal.dart';

class MealLocalRepositoryImpl implements MealsDatasource {
  final MealsDatasource mealsDatasource;

  MealLocalRepositoryImpl({required this.mealsDatasource});

  @override
  Future<List<Meal>> getMealByCategory(String categoryID) {
    return mealsDatasource.getMealByCategory(categoryID);
  }
}
