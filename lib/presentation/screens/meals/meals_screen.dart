import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/presentation/providers/providers.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';

class MealsScreen extends ConsumerStatefulWidget {
  static const name = 'meals-screen';

  final String categoryID;

  const MealsScreen({super.key, required this.categoryID});

  @override
  MealsScreenState createState() => MealsScreenState();
}

class MealsScreenState extends ConsumerState<MealsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mealsProvider.notifier).loadMeals(widget.categoryID);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final meals = ref.watch(mealsProvider);

    final category = categories.firstWhere(
      (item) => item.id == widget.categoryID,
    );

    if (meals.isEmpty) {
      return Loading();
    }

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Text(meals[index].title);
        },
      ),
    );
  }
}
