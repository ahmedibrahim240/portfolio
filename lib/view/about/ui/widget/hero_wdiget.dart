import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/about/ui/widget/hero_image.dart';
import 'package:my_portfolio/view/about/ui/widget/hero_text.dart';

import '../../../../core/helper/app_size.dart';

class HeroWdiget extends StatelessWidget {
  const HeroWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    switch (context.isDesktopOrTablet) {
      case true:
        return const _LargeHero();
      default:
        return const _SmallHero();
    }
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: HeroImage()),
        Gap(AppSize.xxxl),
        const Expanded(flex: 2, child: HeroText()),
      ],
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: const HeroImage(),
        ),
        Gap(AppSize.xl),
        const HeroText(),
      ],
    );
  }
}
