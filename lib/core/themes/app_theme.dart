import 'package:flutter/material.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldDarkBg,
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary200,
      brightness: Brightness.dark,
    ),

    appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.gray[100],
      displayColor: AppColors.gray[100],
    ),
    switchTheme: SwitchThemeData(
      padding: EdgeInsets.zero,

      trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
        return 0;
      }),

      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200.withValues(alpha: .3);
        }
        return AppColors.gray[200]!; // Figma OFF color
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200.withValues(alpha: .3);
        }
        return AppColors.gray[200]!; // Figma OFF color
      }),

      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200;
        }
        return AppColors.gray[500]!; // Figma OFF color
      }),
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldLightBg,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary200,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: AppColors.gray[900],
      displayColor: AppColors.gray[900],
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    switchTheme: SwitchThemeData(
      padding: EdgeInsets.zero,

      trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
        return 0;
      }),

      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200.withValues(alpha: .3);
        }
        return AppColors.gray[200]!;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200.withValues(alpha: .3);
        }
        return AppColors.gray[200]!;
      }),

      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200;
        }
        return AppColors.gray[500]!; // Figma OFF color
      }),
    ),
  );
}
