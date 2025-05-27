import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/config/helpers/helpers.dart';
import 'package:spoonie/domain/entities/entities.dart';
import 'package:spoonie/presentation/providers/providers.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';

class MealDetailScreen extends ConsumerStatefulWidget {
  static const name = 'meal-detail-screen';

  final String mealID;

  const MealDetailScreen({super.key, required this.mealID});

  @override
  MealDetailScreenState createState() => MealDetailScreenState();
}

class MealDetailScreenState extends ConsumerState<MealDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(mealDetailProvider.notifier).loadMeal(widget.mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    final meal = ref.watch(mealDetailProvider)[widget.mealID];

    if (meal == null) {
      return Loading();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppBar(meal: meal),
          SliverToBoxAdapter(child: _BuildSectionTitle(title: 'Ingredients')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(meal.ingredients[index]),
              ),
              childCount: meal.ingredients.length,
            ),
          ),
          SliverToBoxAdapter(child: _BuildSectionTitle(title: 'Preparation')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(meal.steps[index]),
              ),
              childCount: meal.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildSectionTitle extends StatelessWidget {
  final String title;

  const _BuildSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(title, style: textStyles.titleMedium),
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final Meal meal;

  const _CustomSliverAppBar({required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;

    return SliverAppBar(
      foregroundColor: colors.onError,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
      ],
      pinned: true,
      expandedHeight: size.height * 0.4,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed =
              constraints.maxHeight <= kToolbarHeight + (paddingTop * 2);
          final fullTitle = meal.title;
          final displayTitle =
              isCollapsed ? shortenTitle(fullTitle, 3) : fullTitle;

          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 10,
            ),
            title: Text(
              displayTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: isCollapsed ? 1 : 3,
              style: TextStyle(color: colors.onError),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(meal.imageUrl, fit: BoxFit.cover),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                _CustomGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.8, 1.0],
                  colors: [Colors.transparent, Colors.black87],
                ),
                const _CustomGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.25],
                  colors: [Colors.black87, Colors.transparent],
                ),
                const _CustomGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.25],
                  colors: [Colors.black87, Colors.transparent],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({
    required this.begin,
    required this.end,
    required this.stops,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
