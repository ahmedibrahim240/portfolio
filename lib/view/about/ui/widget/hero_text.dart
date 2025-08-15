// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/app_text.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
// import 'package:seo_renderer/seo_renderer.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: context.isDesktopOrTablet,
          replacement: Column(
            crossAxisAlignment: context.isDesktop
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              AppText(
                kAboutMe.fullName,
                textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
                style: context.textStyle.titleLgBold.copyWith(
                  color: context.theme.colorScheme.onBackground,
                ),
                // textRendererStyle: TextRendererStyle.header1,
              ),
              Gap(AppSize.xxl),
              OutlinedButton(onPressed: () {}, child: const Text('Download CV')),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                kAboutMe.fullName,
                textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
                style: context.textStyle.titleLgBold.copyWith(
                  color: context.theme.colorScheme.onBackground,
                ),
                // textRendererStyle: TextRendererStyle.header1,
              ),
              Gap(AppSize.xxl),
              OutlinedButton(onPressed: () {}, child: const Text('Download CV')),
            ],
          ),
        ),
        Gap(AppSize.smallSized),
        AppText(
          kAboutMe.title,
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleMdMedium.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(AppSize.xxl),
        AppText(
          kAboutMe.summary,
          textAlign: context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
            height: 2,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
      ],
    );
  }
}
