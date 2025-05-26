import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoonie/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  static const name = 'home-view';

  final StatefulNavigationShell navigationShell;

  const HomeView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}
