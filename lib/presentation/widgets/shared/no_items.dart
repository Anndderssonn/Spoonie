import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class NoItems extends StatelessWidget {
  final String description;

  const NoItems({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: FadeIn(
          duration: const Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_outline_sharp,
                size: 60,
                color: colors.primary,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: textStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
