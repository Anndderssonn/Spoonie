import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/infrastructure/datasources/infra_datasources.dart';
import 'package:spoonie/infrastructure/repositories/infra_respositories.dart';

final mealsRepositoryProvider = Provider((ref) {
  return MealLocalRepositoryImpl(mealsDatasource: MealLocalDatasource());
});
