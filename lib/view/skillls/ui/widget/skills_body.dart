import 'package:flutter/material.dart';
import 'package:my_portfolio/view/skillls/ui/widget/skills_desktop.dart';

class SkillsBody extends StatelessWidget {
  const SkillsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Visibility(
            // visible: context.isDesktopOrTablet,
            child: SkillsDesktop(),
          ),
        ),
      ],
    );
  }
}
