import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FiltersScreen extends StatefulWidget {
  static const name = 'filters-screen';

  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  bool isVegan = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          Column(
            children: [
              _CustomTitle(title: 'Filter by your preferences'),
              const SizedBox(height: 20),
              _CustomSwitchTitle(
                title: 'Gluten-free',
                subTitle: 'Only include gluten-free meals',
                value: isGlutenFree,
                onChanged: (value) => setState(() => isGlutenFree = value),
              ),
              _CustomSwitchTitle(
                title: 'Lactose-free',
                subTitle: 'Only include lactose-free meals',
                value: isLactoseFree,
                onChanged: (value) => setState(() => isLactoseFree = value),
              ),
              _CustomSwitchTitle(
                title: 'Vegetarian',
                subTitle: 'Only include vegetarian meals',
                value: isVegetarian,
                onChanged: (value) => setState(() => isVegetarian = value),
              ),
              _CustomSwitchTitle(
                title: 'Vegan',
                subTitle: 'Only include vegan meals',
                value: isVegan,
                onChanged: (value) => setState(() => isVegan = value),
              ),
              const Spacer(),
              const SizedBox(height: 90),
              _CustomButton(buttonTitle: 'Aplicar filtros'),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomTitle extends StatelessWidget {
  final String title;

  const _CustomTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(top: 100, left: 20, bottom: 20, right: 20),
      width: double.infinity,
      color: colors.surface,
      child: Text(
        title,
        style: textStyles.headlineSmall?.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CustomSwitchTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool) onChanged;

  const _CustomSwitchTitle({
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Card(
        color: colors.secondaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SwitchListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            title,
            style: textStyles.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.primary,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: textStyles.bodySmall?.copyWith(
              color: colors.primary,
              fontSize: 14,
            ),
          ),
          value: value,
          onChanged: onChanged,
          activeColor: colors.inversePrimary,
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String buttonTitle;

  const _CustomButton({required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.inversePrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.pop();
              },
              child: Text(
                buttonTitle,
                style: textStyles.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
