import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/presentation/providers/providers.dart';

final mealsProvider =
    StateNotifierProvider<MealsNotifierController, List<Meal>>((ref) {
      final fetchMeals = ref.watch(mealsRepositoryProvider).getMealByCategory;
      return MealsNotifierController(getMeals: fetchMeals);
    });

typedef GetMealsCallback = Future<List<Meal>> Function(String categoryID);

class MealsNotifierController extends StateNotifier<List<Meal>> {
  final GetMealsCallback getMeals;

  MealsNotifierController({required this.getMeals}) : super([]);

  Future<void> loadMeals(String categoryID) async {
    final meals = await getMeals(categoryID);
    state = meals;
  }
}
