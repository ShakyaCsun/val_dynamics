import 'package:flutter/material.dart';

/// {@template vsdat_theme}
/// Create ThemeData for VSDAT
/// {@endtemplate}
class VsdatTheme {
  /// {@macro vsdat_theme}
  const VsdatTheme({Color? lightSeed, Color? darkSeed})
    : lightSeed = lightSeed ?? const Color(0xFF8A5BD6),
      darkSeed = darkSeed ?? const Color(0xFFCBA6F7);

  /// Seed [Color] for light theme
  final Color lightSeed;

  /// Seed [Color] for dark theme
  final Color darkSeed;

  /// Light Theme
  ThemeData get lightTheme {
    return _theme(seed: lightSeed);
  }

  /// Dark Theme
  ThemeData get darkTheme {
    return _theme(seed: darkSeed, brightness: Brightness.dark);
  }

  ThemeData _theme({
    required Color seed,
    Brightness brightness = Brightness.light,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );
    final theme = ThemeData.from(colorScheme: colorScheme, useMaterial3: true);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(centerTitle: true),
      drawerTheme: const DrawerThemeData(width: 360),
      navigationRailTheme: const NavigationRailThemeData(
        labelType: NavigationRailLabelType.all,
      ),
      // It is how we opt into newer slider theme for now
      // ignore: deprecated_member_use
      sliderTheme: const SliderThemeData(year2023: false),
    );
  }
}
