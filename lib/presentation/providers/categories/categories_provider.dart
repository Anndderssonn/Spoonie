import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/presentation/providers/providers.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifierController, List<Category>>((ref) {
      final fetchCategories =
          ref.watch(categoriesRepositoryProvider).getCategories;
      return CategoriesNotifierController(getCategories: fetchCategories);
    });

typedef GetCategoriesCallback = Future<List<Category>> Function();

class CategoriesNotifierController extends StateNotifier<List<Category>> {
  final GetCategoriesCallback getCategories;

  CategoriesNotifierController({required this.getCategories}) : super([]);

  Future<void> loadCategories() async {
    final categories = await getCategories();
    state = categories;
  }
}
