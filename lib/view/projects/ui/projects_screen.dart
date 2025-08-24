import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/app_text.dart';
import 'package:my_portfolio/view/projects/ui/widget/proiects_desktop.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.height * .71,
        minHeight: context.height * .3,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('Projects', style: context.textStyle.titleLgBold),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Visibility(
                visible: context.isDesktop,
                replacement: const ProiectsDesktop(),
                child: const ProiectsDesktop(),
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
