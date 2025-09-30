import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/backgraund_blur.dart';
import 'package:my_portfolio/view/about/ui/about_me_page.dart';
import 'package:my_portfolio/view/experience/ui/experience_screen.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';
import 'package:my_portfolio/view/skillls/ui/skills_screen.dart';

import '../../core/widget/app_text.dart';
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
                  top: AppSize.xxxl,
                  start: AppSize.smallSized,
                  end: AppSize.smallSized,
                ),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: AboutMePage()),
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          AppText('Skills', style: context.textStyle.titleLgBold),
                          const Gap(10),
                        ],
                      ),
                    ),

                    const SkillsScreen(),
                    const SliverGap(16),

                    const SliverToBoxAdapter(child: ProjectsScreen()),
                    const SliverToBoxAdapter(child: ExperienceScreen()),
                    const SliverGap(100),
                  ],
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
