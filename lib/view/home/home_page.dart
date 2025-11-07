import 'package:flutter/material.dart';
// In home_page.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/routing/routes.dart';
import 'package:my_portfolio/core/widget/backgraund_blur.dart';
import 'package:my_portfolio/core/widget/home_sction_title.dart';
import 'package:my_portfolio/view/about/ui/about_me_page.dart';
import 'package:my_portfolio/view/about/ui/my_footer.dart';
import 'package:my_portfolio/view/experience/ui/experience_screen.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';
import 'package:my_portfolio/view/skillls/ui/skills_screen.dart';

import '../projects/ui/projects_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ScrollCubitCubit, ScrollCubitState>(
          builder: (context, state) {
            final ScrollCubitCubit scrollCubit = context.read<ScrollCubitCubit>();
            return SingleChildScrollView(
              controller: scrollCubit.scrollController,

              child: Stack(
                children: [
                  const BackgraundBlur(),
                  HomeContent(scrollCubit: scrollCubit),
                  const HomeAppBar(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final ScrollCubitCubit scrollCubit;
  const HomeContent({super.key, required this.scrollCubit});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
        padding: EdgeInsetsDirectional.only(
          top: context.insets.appBarHeight,
          start: context.insets.horizontalPadding,
          end: context.insets.horizontalPadding,
        ),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          shrinkWrap: true,
          slivers: [
            _buildAboutSection(context, scrollCubit),
            _buildSkillsSection(context, scrollCubit),

            _buildProjectsSection(scrollCubit),
            _buildExperienceSection(scrollCubit),
            _buildContactSection(scrollCubit),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAboutSection(
    BuildContext context,
    ScrollCubitCubit scrollCubit,
  ) {
    final aboutKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCubit.registerSection(AppRoutes.about, aboutKey);
    });

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.insets.cardPadding),
        child: KeyedSubtree(key: aboutKey, child: const AboutMePage()),
      ),
    );
  }

  SliverToBoxAdapter _buildSkillsSection(
    BuildContext context,
    ScrollCubitCubit scrollCubit,
  ) {
    final skillsKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCubit.registerSection(AppRoutes.skills, skillsKey);
    });

    return SliverToBoxAdapter(
      child: KeyedSubtree(
        key: skillsKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeSctionTitle(title: 'Skills'),
            const SkillsScreen(),
            Gap(context.insets.appBarHeight),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildProjectsSection(ScrollCubitCubit scrollCubit) {
    final projectsKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCubit.registerSection(AppRoutes.projects, projectsKey);
    });

    return SliverToBoxAdapter(
      child: KeyedSubtree(key: projectsKey, child: const ProjectsScreen()),
    );
  }

  SliverToBoxAdapter _buildExperienceSection(ScrollCubitCubit scrollCubit) {
    final experienceKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCubit.registerSection(AppRoutes.experiences, experienceKey);
    });

    return SliverToBoxAdapter(
      child: KeyedSubtree(key: experienceKey, child: const ExperienceScreen()),
    );
  }

  SliverToBoxAdapter _buildContactSection(ScrollCubitCubit scrollCubit) {
    final contactKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCubit.registerSection(AppRoutes.contact, contactKey);
    });

    return SliverToBoxAdapter(
      child: KeyedSubtree(key: contactKey, child: const MyFooter()),
    );
  }
}
