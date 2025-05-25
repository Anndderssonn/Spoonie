import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/category.dart';

class CategoryLocalRepositoryImpl implements CategoriesDatasource {
  final CategoriesDatasource categoriesDatasource;

  CategoryLocalRepositoryImpl({required this.categoriesDatasource});

  @override
  Future<List<Category>> getCategories() {
    return categoriesDatasource.getCategories();
  }
}
