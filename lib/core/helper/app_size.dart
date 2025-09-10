class AppSize {
  static double get maxWidth => 1280;
  static double get medSized => 12;
  static double get smallSized => 8;
  static double get xsSized => 4;
  static double get xxxl => 80;
  static double get xxl => 40;
  static double get xl => 24;
  static double get lg => 24;
}

abstract class AppInsets {
  double get horizontalPadding;
  double get verticalPadding;
  double get appBarHeight;
  double get cardPadding;
}

class LargeInsets implements AppInsets {
  @override
  double get horizontalPadding => 80;

  @override
  double get verticalPadding => 16;

  @override
  double get appBarHeight => 64;

  @override
  double get cardPadding => AppSize.xl;
}

class MediumInsets implements AppInsets {
  @override
  double get horizontalPadding => 40;

  @override
  double get verticalPadding => 12;

  @override
  double get appBarHeight => 56;

  @override
  double get cardPadding => AppSize.lg;
}

class SmallInsets implements AppInsets {
  @override
  double get horizontalPadding => 16;

  @override
  double get verticalPadding => 8;

  @override
  double get appBarHeight => 52;

  @override
  double get cardPadding => AppSize.lg;
}
