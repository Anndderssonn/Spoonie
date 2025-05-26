import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoonie/domain/entities/entities.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push('/meals/${category.id}'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((0.55 * 255).toInt()),
              category.color.withAlpha((0.9 * 255).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title, style: textStyles.titleMedium),
      ),
    );
  }
}
