import 'package:go_router/go_router.dart';
import 'package:spoonie/presentation/screens/screens.dart';
import 'package:spoonie/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeView(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => const CategoriesScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'meals/:categoryID',
                  name: MealsScreen.name,
                  builder: (context, state) {
                    final categoryID =
                        state.pathParameters['categoryID'] ?? 'no-id';
                    return MealsScreen(categoryID: categoryID);
                  },
                ),
                GoRoute(
                  path: 'meal-detail/:mealID',
                  name: MealDetailScreen.name,
                  builder: (context, state) {
                    final mealID = state.pathParameters['mealID'] ?? 'no-id';
                    return MealDetailScreen(mealID: mealID);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (context, state) => FavoritesView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
