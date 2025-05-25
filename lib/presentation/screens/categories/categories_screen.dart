import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/presentation/providers/providers.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  static const name = 'categories-screen';

  const CategoriesScreen({super.key});

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoriesProvider.notifier).loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    if (categories.isEmpty) {
      return Loading();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return CategoryGridItem(category: categories[index]);
        },
      ),
    );
  }
}
