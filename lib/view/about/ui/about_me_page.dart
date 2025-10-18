import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/about/ui/widget/hero_wdiget.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(context.insets.appBarHeight),
        const HeroWdiget(),
        Gap(context.insets.appBarHeight),
      ],
    );
  }
}
