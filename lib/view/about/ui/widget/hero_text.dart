// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/helper/helper_functions.dart';
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
            children: [const BuildNameAndJob(), Gap(AppSize.xl), const _DownLoadCVBtn()],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              const minWidthForHeaderRow = 480.0;
              if (constraints.maxWidth < minWidthForHeaderRow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildNameAndJob(),
                    Gap(AppSize.xl),
                    const _DownLoadCVBtn(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: BuildNameAndJob()),
                  Gap(AppSize.xxl),
                  const _DownLoadCVBtn(),
                ],
              );
            },
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
            height: 1.6,
          ),
        ),
        Gap(AppSize.medSized),
        LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final maxCard = w >= 560 ? (w - AppSize.smallSized) / 2 : w;
            return Wrap(
              spacing: AppSize.smallSized,
              runSpacing: AppSize.smallSized,
              alignment: context.isDesktopOrTablet
                  ? WrapAlignment.start
                  : WrapAlignment.center,
              children: kAboutMe.summaryHighlights
                  .asMap()
                  .entries
                  .map(
                    (entry) => ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: math.min(320, maxCard)),
                      child: _SummaryHighlightCard(
                        highlight: entry.value,
                        index: entry.key,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
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

class _DownLoadCVBtn extends StatefulWidget {
  const _DownLoadCVBtn();

  @override
  State<_DownLoadCVBtn> createState() => _DownLoadCVBtnState();
}

class _DownLoadCVBtnState extends State<_DownLoadCVBtn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: OutlinedButton(
          onPressed: () async {
            await HelperFunctions.launchToUrl(Uri.parse(kAboutMe.cvLink));
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: _isHovered ? context.theme.primaryColor : context.theme.dividerColor,
              width: _isHovered ? 1.5 : 1.0,
            ),
            foregroundColor: _isHovered
                ? context.theme.primaryColor
                : context.theme.textTheme.bodyLarge?.color,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const FittedBox(fit: BoxFit.scaleDown, child: Text('Resume')),
        ),
      ),
    );
  }
}

class _SummaryHighlightCard extends StatefulWidget {
  const _SummaryHighlightCard({required this.highlight, required this.index});

  final AboutHighlight highlight;
  final int index;

  @override
  State<_SummaryHighlightCard> createState() => _SummaryHighlightCardState();
}

class _SummaryHighlightCardState extends State<_SummaryHighlightCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );

    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    // staggered delay per card
    Future.delayed(Duration(milliseconds: 200 + widget.index * 150), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.theme.colorScheme;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()..scale(_hovered ? 1.03 : 1.0),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              color: _hovered
                  ? scheme.surfaceContainerHighest.withValues(alpha: 0.55)
                  : scheme.surfaceContainerHighest.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _hovered
                    ? scheme.primary.withValues(alpha: 0.6)
                    : scheme.outline.withValues(alpha: 0.15),
                width: _hovered ? 1.5 : 1.0,
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: scheme.primary.withValues(alpha: 0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : [],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // accent bar + title row
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: 3,
                        height: _hovered ? 22 : 16,
                        decoration: BoxDecoration(
                          color: scheme.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.highlight.title,
                        style: context.textStyle.titleSmBold.copyWith(
                          color: scheme.primary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSize.xsSized),
                  Text(
                    widget.highlight.body,
                    textAlign: TextAlign.start,
                    style: context.textStyle.bodyMdMedium.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.92),
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildNameAndJob extends StatelessWidget {
  const BuildNameAndJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
