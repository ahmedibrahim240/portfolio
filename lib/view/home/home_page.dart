import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/backgraund_blur.dart';
import 'package:my_portfolio/core/widget/home_sction_title.dart';
import 'package:my_portfolio/view/about/ui/about_me_page.dart';
import 'package:my_portfolio/view/about/ui/my_footer.dart';
import 'package:my_portfolio/view/experience/ui/experience_screen.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';
import 'package:my_portfolio/view/skillls/ui/skills_screen.dart';

import '../projects/ui/projects_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgraundBlur(),
            Align(
              alignment: AlignmentDirectional.center,

              child: Container(
                constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
                padding: EdgeInsetsDirectional.only(
                  top: context.insets.appBarHeight,
                  start: context.insets.horizontalPadding,

                  end: context.insets.horizontalPadding,
                ),
                child: SingleChildScrollView(
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: true,
                    shrinkWrap: true,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.insets.cardPadding,
                          ),
                          child: const AboutMePage(),
                        ),
                      ),
                      const SliverToBoxAdapter(child: HomeSctionTitle(title: 'Skills')),

                      const SkillsScreen(),
                      const SliverGap(16),

                      const SliverToBoxAdapter(child: ProjectsScreen()),
                      const SliverToBoxAdapter(child: ExperienceScreen()),
                      const SliverGap(16),

                      const SliverToBoxAdapter(child: MyFooter()),
                    ],
                  ),
                ),
              ),
            ),
            const HomeAppBar(),
          ],
        ),
      ),
    );
  }
}
