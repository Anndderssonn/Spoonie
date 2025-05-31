import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/domain/enums/enums.dart';
import 'package:spoonie/presentation/providers/providers.dart';

final mealsProvider =
    StateNotifierProvider<MealsNotifierController, List<Meal>>((ref) {
      final fetchMeals = ref.watch(mealsRepositoryProvider).getMealsBy;
      final filters = ref.watch(filtersProvider);
      return MealsNotifierController(getMeals: fetchMeals, filters: filters);
    });

typedef GetMealsCallback =
    Future<List<Meal>> Function(String categoryID, Map<Filters, bool> filters);

class MealsNotifierController extends StateNotifier<List<Meal>> {
  final GetMealsCallback getMeals;
  final Map<Filters, bool> filters;

  MealsNotifierController({required this.getMeals, required this.filters})
    : super([]);

  Future<void> loadMeals(String categoryID) async {
    state = [];
    final meals = await getMeals(categoryID, filters);
    state = meals;
  }
}
