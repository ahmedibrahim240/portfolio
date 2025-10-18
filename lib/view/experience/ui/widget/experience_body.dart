import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/home_sction_title.dart';
import 'package:my_portfolio/view/experience/ui/widget/experince_desktop.dart';
import 'package:my_portfolio/view/experience/ui/widget/experince_mobile.dart';

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeSctionTitle(title: 'Experiences'),

        Center(
          child: Visibility(
            visible: context.isDesktop,
            replacement: const ExperinceMobile(),
            child: const ExperinceDesktop(),
          ),
        ),
        Gap(context.insets.appBarHeight),
      ],
    );
  }
}
