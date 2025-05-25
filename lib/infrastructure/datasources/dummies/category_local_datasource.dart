import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spoonie/domain/datasources/domain_datasources.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/mappers/mappers.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class CategoryLocalDatasource implements CategoriesDatasource {
  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    final String categoriesDummyResponse = await rootBundle.loadString(
      'assets/category_dummy.json',
    );
    final Map<String, dynamic> categoriesDummyData = jsonDecode(
      categoriesDummyResponse,
    );
    final dummyLocalCategories = CategoryDummy.fromJson(categoriesDummyData);
    final List<Category> categories =
        dummyLocalCategories.data
            .map(
              (category) => CategoryMapper.localDummyCategoryToEntity(category),
            )
            .toList();
    return categories;
  }
}
