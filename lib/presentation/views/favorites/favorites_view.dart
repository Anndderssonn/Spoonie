import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/presentation/providers/providers.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Meals')),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const DietaryTable(),
            const SizedBox(height: 10),
            if (favoriteMeals.isEmpty)
              NoItems(
                description:
                    '🍜 Do your favorite meals a favor and give them the spotlight they deserve! 🍨',
              ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteMeals.length,
                itemBuilder: (context, index) {
                  return _FavoriteMealsCard(meal: favoriteMeals[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteMealsCard extends StatelessWidget {
  final Meal meal;

  const _FavoriteMealsCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 2,
      color: colors.onPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    style: textStyles.bodyLarge?.copyWith(
                      color: colors.inverseSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    children: [
                      _CustomIcons(
                        icon: Icons.no_food_outlined,
                        belongsCategory: meal.isGlutenFree,
                      ),
                      _CustomIcons(
                        icon: Icons.spa_outlined,
                        belongsCategory: meal.isVegan,
                      ),
                      _CustomIcons(
                        icon: Icons.restaurant_menu_outlined,
                        belongsCategory: meal.isVegetarian,
                      ),
                      _CustomIcons(
                        icon: Icons.free_breakfast_outlined,
                        belongsCategory: meal.isLactoseFree,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipOval(
              child: FadeInImage(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomIcons extends StatelessWidget {
  final IconData icon;
  final bool belongsCategory;

  const _CustomIcons({required this.icon, required this.belongsCategory});

  @override
  Widget build(BuildContext context) {
    return Icon(
      size: 14,
      icon,
      color: belongsCategory ? Colors.green : Colors.red,
    );
  }
}
