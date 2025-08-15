import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';

import '../themes/app_text_style.dart';
import 'enums.dart';

extension StyleHelper on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
  DeviceType get getDseviceType {
    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 900) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  bool get isMobile => getDseviceType == DeviceType.mobile;
  bool get isTablet => getDseviceType == DeviceType.tablet;
  bool get isDesktop => getDseviceType == DeviceType.desktop;
  bool get isDesktopOrTablet => isDesktop || isTablet;
  AppTextStyle get textStyle {
    switch (getDseviceType) {
      case DeviceType.mobile:
      case DeviceType.tablet:
        return SmallTextStyles();
      case DeviceType.desktop:
        return LargeTextStyles();
    }
  }

  ThemeData get theme => Theme.of(this);
  AppInsets get insets {
    switch (getDseviceType) {
      case DeviceType.mobile:
        return SmallInsets();
      case DeviceType.tablet:
        return MediumInsets();
      case DeviceType.desktop:
        return LargeInsets();
    }
  }
}

class CustomColors {
  const CustomColors._({required this.background});
  final Color background;

  factory CustomColors._light() {
    return const CustomColors._(background: AppColors.scaffoldLightBg);
  }

  factory CustomColors._dark() {
    return const CustomColors._(background: AppColors.scaffoldDarkBg);
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColors {
    if (brightness == Brightness.dark) return CustomColors._dark();
    return CustomColors._light();
  }
}
