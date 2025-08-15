// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldDarkBg,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      background: AppColors.scaffoldDarkBg,
      onBackground: AppColors.gray[100]!,
      surface: AppColors.gray[850]!,
      onSurface: AppColors.gray[300]!,
      onInverseSurface: AppColors.gray[400]!,
      tertiary: AppColors.gray[900]!,
      outline: AppColors.gray[800]!,
      outlineVariant: AppColors.gray[800]!,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        backgroundColor: _primaryButtonStates,
        foregroundColor: _primaryforegroundColor,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSize.medSized, vertical: 10),
        ),
        textStyle: _dartElvatedButtonTextStyle,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        side: _outlineButtonStates,
        foregroundColor: _outlineforegroundColor,

        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSize.medSized, vertical: 10),
        ),
        textStyle: _dartOutlineButtonTextStyle,
      ),
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldLightBg,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.scaffoldLightBg,
      onBackground: AppColors.gray[800]!,
      surface: AppColors.gray[200]!,
      onSurface: AppColors.gray[700]!,
      onInverseSurface: AppColors.gray[600]!,
      tertiary: AppColors.gray[900]!,
      outline: AppColors.gray[300]!,
      outlineVariant: AppColors.gray[400]!,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        backgroundColor: _primaryButtonStates,
        foregroundColor: _primaryforegroundColor,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSize.medSized, vertical: 10),
        ),
        textStyle: _lightElvatedButtonTextStyle,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        side: _outlineButtonStates,
        foregroundColor: _outlineforegroundColor,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSize.medSized, vertical: 10),
        ),
        textStyle: _lightOutlineButtonTextStyle,
      ),
    ),
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

  static final _primaryButtonStates = WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return AppColors.primary.withValues(alpha: .7);
    }
    return AppColors.primary;
  });
  static final _primaryforegroundColor = WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return AppColors.scaffoldLightBg.withValues(alpha: .7);
    }
    return AppColors.scaffoldLightBg;
  });
  static final _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return BorderSide(color: AppColors.primary.withValues(alpha: .7));
    }
    return const BorderSide(color: AppColors.primary);
  });
  static final _outlineforegroundColor = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
      return AppColors.primary.withValues(alpha: .7);
    }
    return AppColors.primary;
  });

  static WidgetStatePropertyAll<TextStyle?>? get _dartElvatedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle?>(
        TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
      );

  static WidgetStatePropertyAll<TextStyle?>? get _lightElvatedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle?>(
        TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
      );

  static WidgetStatePropertyAll<TextStyle?>? get _dartOutlineButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle?>(
        TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
      );

  static WidgetStatePropertyAll<TextStyle?>? get _lightOutlineButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(color: AppColors.gray[800], fontWeight: FontWeight.w500),
      );
}
