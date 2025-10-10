// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/styled_card.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      delegate: SliverChildBuilderDelegate((context, index) {
        var item = kAboutMe.skills[index];
        return StyledCard(
          borderEffect: false,
          child: Text(
            item,
            textAlign: TextAlign.center,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }, childCount: kAboutMe.skills.length),

      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 6 : 3,
      ),
    );
  }
}
