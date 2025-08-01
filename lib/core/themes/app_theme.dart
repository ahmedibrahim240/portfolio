import 'package:flutter/material.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldDarkBg,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.scaffoldDarkBg,
      onSurface: AppColors.gray[100]!,
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
        return AppColors.gray[100]!; // Figma OFF color
      }),
      trackColor: WidgetStateProperty.all<Color>(Colors.transparent),

      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200;
        }
        return AppColors.gray[100]!; // Figma OFF color
      }),
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldLightBg,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.scaffoldLightBg,
      onSurface: AppColors.gray[900]!,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    switchTheme: SwitchThemeData(
      padding: EdgeInsets.zero,

      trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
        return 0;
      }),

      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200;
        }
        return AppColors.gray[400]!;
      }),
      trackColor: WidgetStateProperty.all<Color>(Colors.transparent),

      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary200;
        }
        return AppColors.gray[400]!;
      }),
    ),
  );
}
