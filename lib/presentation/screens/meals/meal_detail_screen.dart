import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const name = 'meal-detail-screen';

  final String mealID;

  const MealDetailScreen({super.key, required this.mealID});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(mealID));
  }
}
