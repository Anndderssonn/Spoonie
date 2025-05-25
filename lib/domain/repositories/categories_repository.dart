import 'package:spoonie/domain/entities/entities.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();
}
