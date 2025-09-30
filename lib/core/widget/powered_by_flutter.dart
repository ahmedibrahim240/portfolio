// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FlutterLogo(size: 30),
        const Gap(10),
        Text(
          "Powered By Flutter",
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
