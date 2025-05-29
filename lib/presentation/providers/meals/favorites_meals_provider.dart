import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/entities/entities.dart';

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifierController, List<Meal>>(
      (ref) => FavoritesMealsNotifierController(),
    );

class FavoritesMealsNotifierController extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifierController() : super([]);

  void toggleFavorite(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state.remove(meal);
      state = [...state];
    } else {
      state = [...state, meal];
    }
  }
}
