import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Color(0xFF81B622);
    const scaffoldBgColor = Color(0xFFE1E6D6);
    const appBarBgColor = Color(0xFFB9D38A);
    const secondaryColor = Color(0xFFAD7D52);
    const secondaryContainer = Color(0xFFFFEDD5);
    const onSecondaryContainer = Color(0xFF4C2F16);
    const errorColor = Color(0xFFB00020);

    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ).copyWith(
      surface: Colors.white,
      onSurface: Color(0xFF333333),
      secondary: secondaryColor,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      error: errorColor,
      onError: Colors.white,
    );

    return ThemeData(
      colorScheme: baseColorScheme,
      scaffoldBackgroundColor: scaffoldBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBgColor,
        elevation: 2,
        foregroundColor: baseColorScheme.onSurface,
        titleTextStyle: GoogleFonts.montserrat(
          color: baseColorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: baseColorScheme.onSurface,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: baseColorScheme.onSurface,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color(0xFF444444),
        ),
        bodySmall: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Color(0xFF888888),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: seedColor,
        unselectedItemColor: Color(0xFFB0B0B0),
        showUnselectedLabels: true,
      ),
    );
  }
}
