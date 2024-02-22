import 'package:flash/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemesStyle {
  static ThemeData darkTheme(context) {
    return ThemeData(
      useMaterial3: false,
      colorScheme: const ColorScheme(
        brightness: ThemesColors.brightness,
        primary: ThemesColors.primary,
        onPrimary: ThemesColors.white,
        secondary: ThemesColors.white,
        onSecondary: ThemesColors.white,
        error: ThemesColors.error,
        onError: ThemesColors.error,
        background: ThemesColors.white,
        onBackground: ThemesColors.white,
        surface: ThemesColors.white,
        onSurface: ThemesColors.white,
      ),
    );
  }
}
