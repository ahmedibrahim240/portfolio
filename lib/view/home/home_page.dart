import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/widget/backgraund_blur.dart';
import 'package:my_portfolio/view/about/ui/about_me_page.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';
import 'package:my_portfolio/view/projects/ui/projects_screen.dart';

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
                child: const SingleChildScrollView(
                  child: Column(children: [AboutMePage(), ProjectsScreen()]),
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
