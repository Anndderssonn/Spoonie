import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/enums/enums.dart';

final filtersProvider =
    StateNotifierProvider<FiltersMealsNotifierController, Map<Filters, bool>>(
      (ref) => FiltersMealsNotifierController(),
    );

class FiltersMealsNotifierController extends StateNotifier<Map<Filters, bool>> {
  FiltersMealsNotifierController()
    : super({
        Filters.glutenFree: false,
        Filters.vegetarian: false,
        Filters.vegan: false,
        Filters.lactoseFree: false,
      });

  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}
