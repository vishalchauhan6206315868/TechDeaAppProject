import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors extracted from the TechDea Logo & Website
  static const Color background = Color(0xFF080811);
  static const Color surface = Color(0xFF121124);
  static const Color surfaceLight = Color(0xFF1B1A33);
  static const Color cardBg = Color(0xFF14132B);

  // Purple / Violet Accent Gradients
  static const Color primaryPurple = Color(0xFF9D4EDD);
  static const Color deepPurple = Color(0xFF7B2CBF);
  static const Color brandPurple = Color(0xFF7C3AED);
  static const Color electricViolet = Color(0xFFC77DFF);
  static const Color darkViolet = Color(0xFF5A189A);

  // Accent Colors
  static const Color cyanAccent = Color(0xFF00E5FF);
  static const Color amberAccent = Color(0xFFFFB703);

  // Silver / Chrome Accents
  static const Color silverChrome = Color(0xFFE2E4EC);
  static const Color silverMuted = Color(0xFFA0A3BD);

  // Linear Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [
      Color(0xFF281347),
      Color(0xFF181335),
      Color(0xFF0F0E24),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFF181530),
      Color(0xFF100E22),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Neon Glow Shadows
  static List<BoxShadow> purpleGlow({double radius = 24, double spread = 2}) => [
        BoxShadow(
          color: primaryPurple.withValues(alpha: 0.45),
          blurRadius: radius,
          spreadRadius: spread,
        ),
        BoxShadow(
          color: deepPurple.withValues(alpha: 0.25),
          blurRadius: radius * 1.5,
          spreadRadius: spread * 1.2,
        ),
      ];

  // Primary Theme Data
  static ThemeData get darkTheme {
    final baseTheme = ThemeData(brightness: Brightness.dark);
    return baseTheme.copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primaryPurple,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme),
      colorScheme: const ColorScheme.dark(
        primary: primaryPurple,
        secondary: electricViolet,
        surface: surface,
        onSurface: silverChrome,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: silverChrome,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
