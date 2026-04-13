import 'package:flutter/material.dart';

/// Paleta: vermelho (acento), preto e cinzas neutros.
class AppTheme {
  static const Color _red = Color(0xFFDC2626);
  static const Color _redDeep = Color(0xFFB91C1C);
  static const Color _black = Color(0xFF0A0A0A);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _red,
      brightness: Brightness.light,
    ).copyWith(
      primary: _redDeep,
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFFEE2E2),
      onPrimaryContainer: const Color(0xFF7F1D1D),
      secondary: const Color(0xFF262626),
      onSecondary: Colors.white,
      tertiary: const Color(0xFF404040),
      onTertiary: Colors.white,
      surface: const Color(0xFFF5F5F5),
      onSurface: _black,
      onSurfaceVariant: const Color(0xFF525252),
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: const Color(0xFFFAFAFA),
      surfaceContainer: const Color(0xFFF0F0F0),
      surfaceContainerHigh: const Color(0xFFEBEBEB),
      surfaceContainerHighest: const Color(0xFFE5E5E5),
      outline: const Color(0xFFA3A3A3),
      outlineVariant: const Color(0xFFD4D4D4),
      shadow: Colors.black,
      scrim: Colors.black54,
      inverseSurface: const Color(0xFF1C1C1C),
      onInverseSurface: const Color(0xFFF5F5F5),
      inversePrimary: const Color(0xFFFCA5A5),
      error: const Color(0xFF991B1B),
      onError: Colors.white,
      surfaceTint: _redDeep,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onPrimary,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: scheme.surfaceContainerLowest,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.65),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: scheme.outline.withValues(alpha: 0.7), width: 2),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFF262626),
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return scheme.onSurfaceVariant;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return scheme.primary;
            }
            return scheme.surfaceContainerHighest;
          }),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _red,
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color(0xFFEF4444),
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFF7F1D1D),
      onPrimaryContainer: const Color(0xFFFEE2E2),
      secondary: const Color(0xFFD4D4D4),
      onSecondary: _black,
      tertiary: const Color(0xFFA3A3A3),
      onTertiary: _black,
      surface: const Color(0xFF0A0A0A),
      onSurface: const Color(0xFFF5F5F5),
      onSurfaceVariant: const Color(0xFFA3A3A3),
      surfaceContainerLowest: const Color(0xFF050505),
      surfaceContainerLow: const Color(0xFF121212),
      surfaceContainer: const Color(0xFF171717),
      surfaceContainerHigh: const Color(0xFF1F1F1F),
      surfaceContainerHighest: const Color(0xFF2A2A2A),
      outline: const Color(0xFF525252),
      outlineVariant: const Color(0xFF3F3F3F),
      shadow: Colors.black,
      scrim: Colors.black87,
      inverseSurface: const Color(0xFFE5E5E5),
      onInverseSurface: const Color(0xFF171717),
      inversePrimary: _redDeep,
      error: const Color(0xFFF87171),
      onError: _black,
      surfaceTint: const Color(0xFFEF4444),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onPrimary,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: scheme.surfaceContainerLow,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.45),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: scheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFF2A2A2A),
        contentTextStyle: const TextStyle(color: Color(0xFFF5F5F5)),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return scheme.onSurfaceVariant;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return scheme.primary;
            }
            return scheme.surfaceContainerHighest;
          }),
        ),
      ),
    );
  }
}
