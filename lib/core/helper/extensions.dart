import 'package:flutter/material.dart';

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
  AppTextStyle get textStyle {
    switch (getDseviceType) {
      case DeviceType.mobile:
      case DeviceType.tablet:
        return SmallTextStyles();
      case DeviceType.desktop:
        return LargeTextStyles();
    }
  }
}
