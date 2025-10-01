// ignore_for_file: deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/app_text.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
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
              const BuildNameAndJob(),
              Gap(AppSize.xl),
              OutlinedButton(onPressed: () {}, child: const Text('Download CV')),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BuildNameAndJob(),
              Gap(AppSize.xxl),
              OutlinedButton(onPressed: () {}, child: const Text('Download CV')),
            ],
          ),
        ),
        Gap(AppSize.smallSized),
        OffsetText(
          text: kAboutMe.summary,
          duration: const Duration(milliseconds: 800),
          slideType: SlideAnimationType.alternateLR,
          textAlignment: context.isDesktopOrTablet
              ? TextAlignment.start
              : TextAlignment.center,
          textStyle: context.textStyle.titleMdMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
            height: 2,
          ),
        ),
        // DefaultTextStyle(
        //   textAlign: context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
        //   style: context.textStyle.titleMdMedium.copyWith(
        //     color: context.theme.colorScheme.onSurface,
        //     height: 2,
        //   ),
        //   child: AnimatedTextKit(
        //     isRepeatingAnimation: false,
        //     animatedTexts: [TyperAnimatedText(kAboutMe.summary)],
        //   ),
        // ),
      ],
    );
  }
}

class BuildNameAndJob extends StatelessWidget {
  const BuildNameAndJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          kAboutMe.fullName,
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleLgBold.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(AppSize.smallSized),
        DefaultTextStyle(
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleMdMedium.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
          child: AnimatedTextKit(
            repeatForever: true,

            animatedTexts: [TyperAnimatedText(kAboutMe.title)],
          ),
        ),
      ],
    );
  }
}
