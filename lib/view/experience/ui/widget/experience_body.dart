import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/app_text.dart';
import 'package:my_portfolio/view/experience/ui/widget/experince_desktop.dart';

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Experiences', style: context.textStyle.titleLgBold),
        const Gap(10),
        Center(
          child: Visibility(
            visible: context.isDesktopOrTablet,
            child: const ExperinceDesktop(),
          ),
        ),
      ],
    );
  }
}
