// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

import 'app_text.dart';

class HomeSctionTitle extends StatelessWidget {
  final String title;
  const HomeSctionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(context.insets.verticalPadding + 5),
        AppText(
          title,
          style: context.textStyle.titleSmBold.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),

        Gap(context.insets.verticalPadding + 5),
      ],
    );
  }
}
