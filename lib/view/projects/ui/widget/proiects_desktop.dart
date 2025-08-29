import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/projects/ui/widget/project_item_card.dart';

import '../../data/projects_models.dart';

class ProiectsDesktop extends StatelessWidget {
  const ProiectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxCont) {
        return CarouselSlider(
          options: CarouselOptions(
            height: boxCont.maxHeight,
            viewportFraction: context.isMobile ? .85 : .33,

            enlargeCenterPage: true,
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            enableInfiniteScroll: true,
            disableCenter: true,
          ),
          items: allProjects.map((project) {
            return Visibility(
              // visible: context.isDesktop,
              // replacement: ProjectItemCardMoble(project: project),
              child: ProjectItemCard(project: project),
            );
          }).toList(),
        );
      },
    );
  }
}
