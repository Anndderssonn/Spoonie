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
                  path: 'meals/:id',
                  name: MealsScreen.name,
                  builder: (context, state) {
                    final categoryID = state.pathParameters['id'] ?? 'no-id';
                    return MealsScreen(categoryID: categoryID);
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
