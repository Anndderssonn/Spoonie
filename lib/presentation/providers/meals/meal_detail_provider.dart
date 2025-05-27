import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/presentation/providers/providers.dart';

final mealDetailProvider =
    StateNotifierProvider<MealMapNotifierController, Map<String, Meal>>((ref) {
      final fetchMealID = ref.watch(mealsRepositoryProvider).getMealByID;
      return MealMapNotifierController(getMeal: fetchMealID);
    });

typedef GetMealCallback = Future<Meal> Function(String mealID);

class MealMapNotifierController extends StateNotifier<Map<String, Meal>> {
  final GetMealCallback getMeal;

  MealMapNotifierController({required this.getMeal}) : super({});

  Future<void> loadMeal(String mealID) async {
    if (state[mealID] != null) return;
    final meal = await getMeal(mealID);
    state = {...state, mealID: meal};
  }
}
