import 'package:flutter/material.dart';
import 'package:my_portfolio/view/about/ui/widget/hero_wdiget.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeroWdiget();
    // return Column(
    //   crossAxisAlignment: context.isDesktop
    //       ? CrossAxisAlignment.start
    //       : CrossAxisAlignment.center,
    //   children: [const Text("Flutter"), const HeroWdiget()],
    // );
  }
}
