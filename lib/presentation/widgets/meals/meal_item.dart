import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoonie/config/helpers/helpers.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';
import 'package:spoonie/domain/entities/entities.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: GestureDetector(
        onTap: () => context.push('/meal-detail/${meal.id}'),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule_outlined,
                          label: '${meal.duration} min',
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.workspace_premium_outlined,
                          label: capitalizeFirstLetter(meal.complexity.name),
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.money_outlined,
                          label: capitalizeFirstLetter(meal.affordability.name),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
