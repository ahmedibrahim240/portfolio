import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/projects/ui/widget/proiects_desktop.dart';

import '../../../core/widget/home_sction_title.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: context.isTablet ? 500 : 610,
        minHeight: context.isTablet ? 200 : 400,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSctionTitle(title: 'Projects'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
              child: Visibility(
                // visible: context.isDesktop,
                // replacement: const ProiectsDesktop(),
                child: ProiectsDesktop(),
              ),
            ),
          ),
          Gap(20),
        ],
      ),
    );
  }
}
