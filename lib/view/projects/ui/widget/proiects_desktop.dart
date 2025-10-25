import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
import 'package:my_portfolio/view/projects/ui/widget/project_item_card.dart';

class ProiectsDesktop extends StatelessWidget {
  const ProiectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxCont) {
        return CarouselSlider(
          options: CarouselOptions(
            height: boxCont.maxHeight,
            viewportFraction: context.isDesktop ? .87 : .85,
            animateToClosest: false,
            enlargeCenterPage: false,

            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enableInfiniteScroll: true,
            disableCenter: false,
          ),
          items: kAboutMe.projects.map((project) {
            return Visibility(
              visible: context.isDesktop,
              replacement: ProjectItemCard(project: project),
              child: ProjectItemCard2(project: project),
            );
          }).toList(),
        );
      },
    );
  }
}
