import 'package:flutter/material.dart';
import 'package:spoonie/config/theme/app_theme.dart';
import 'package:spoonie/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoonie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const CategoriesScreen(),
    );
  }
}
