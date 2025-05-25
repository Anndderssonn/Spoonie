import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class MealMapper {
  static Meal localDummyMealToEntity(MealDatum meal) => Meal(
    id: meal.id,
    categories: meal.categories,
    title: meal.title,
    imageUrl: meal.imageUrl,
    ingredients: meal.ingredients,
    steps: meal.steps,
    duration: meal.duration,
    complexity: meal.complexity,
    affordability: meal.affordability,
    isGlutenFree: meal.isGlutenFree,
    isLactoseFree: meal.isLactoseFree,
    isVegan: meal.isVegan,
    isVegetarian: meal.isVegetarian,
  );
}
