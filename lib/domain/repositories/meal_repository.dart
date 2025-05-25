import 'package:spoonie/domain/entities/entities.dart';

abstract class MealRepository {
  Future<List<Meal>> getMealByCategory(String categoryID);
}
