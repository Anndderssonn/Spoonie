import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/infrastructure/datasources/infra_datasources.dart';
import 'package:spoonie/infrastructure/repositories/infra_respositories.dart';

final categoriesRepositoryProvider = Provider((ref) {
  return CategoryLocalRepositoryImpl(
    categoriesDatasource: CategoryLocalDatasource(),
  );
});
