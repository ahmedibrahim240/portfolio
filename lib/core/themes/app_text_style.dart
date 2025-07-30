import 'package:flutter/material.dart';

abstract class AppTextStyle {
  TextStyle get titleSmBold;
  TextStyle get titleMdMedium;
  TextStyle get titleLgBold;
  TextStyle get bodyMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
  TextStyle get heading1;
  TextStyle get heading2;
  TextStyle get caption;
}

class SmallTextStyles implements AppTextStyle {
  @override
  TextStyle get titleSmBold => const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold => const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading1 => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  TextStyle get heading2 => const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  @override
  TextStyle get caption => const TextStyle(fontSize: 8, fontWeight: FontWeight.w400);
}

class LargeTextStyles implements AppTextStyle {
  @override
  TextStyle get titleSmBold => const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBold => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading1 => const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

  @override
  TextStyle get heading2 => const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

  @override
  TextStyle get caption => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
}
