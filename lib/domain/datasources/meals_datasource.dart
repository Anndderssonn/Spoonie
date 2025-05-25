import 'package:spoonie/domain/entities/entities.dart';

abstract class MealsDatasource {
  Future<List<Meal>> getMealByCategory(String categoryID);
}
