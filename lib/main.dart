import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoonie/config/router/app_router.dart';
import 'package:spoonie/config/theme/app_theme.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Spoonie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
