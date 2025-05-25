import 'package:spoonie/domain/entities/entities.dart';

abstract class CategoriesDatasource {
  Future<List<Category>> getCategories();
}
