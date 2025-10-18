// ignore_for_file: deprecated_member_use

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/helper/helper_functions.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';
import 'package:my_portfolio/core/widget/styled_card.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';

final expLen = kAboutMe.experiences.length;
final scaleFA = 150.0;
final expPointSize = 16.0;
final expPointFA = expHeight / 2 - expPointSize / 2;

class ExperinceDesktop extends StatelessWidget {
  const ExperinceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      height: expLen * scaleFA + scaleFA,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * scaleFA,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.colorScheme.primary.withValues(alpha: 0),
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.primary.withValues(alpha: 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          for (int i = 0; i < expLen; i++) ...[
            if (i.isEven)
              PositionedDirectional(
                top: i * scaleFA,
                start: 400,
                end: 0,
                child: ExperineceCardItem(item: kAboutMe.experiences[i], isEven: true),
              )
            else
              PositionedDirectional(
                top: i * scaleFA,
                end: 400,
                start: 0,
                child: ExperineceCardItem(item: kAboutMe.experiences[i], isEven: false),
              ),

            PositionedDirectional(
              top: i * scaleFA + expPointFA,
              end: 0,
              start: 0,

              child: Container(
                alignment: Alignment.center,
                width: expPointSize,
                height: expPointSize,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.onBackground.withValues(alpha: .25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointSize / 2,
                  height: expPointSize / 2,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.onBackground.withValues(alpha: .8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

const expWidth = 300.0;
const expHeight = 225.0;
const expMobileHeight = 190.0;

class ExperineceCardItem extends StatelessWidget {
  final ExperienceModels item;
  final bool isEven;
  const ExperineceCardItem({super.key, required this.item, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: isEven,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .07,
            child: DottedLine(dashColor: context.theme.colorScheme.onBackground),
          ),
        ),

        ExperineceItem(item: item),
        Visibility(
          visible: !isEven,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .07,

            child: DottedLine(dashColor: context.theme.colorScheme.onBackground),
          ),
        ),
      ],
    );
  }
}

class ExperineceItem extends StatelessWidget {
  const ExperineceItem({super.key, required this.item});

  final ExperienceModels item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await HelperFunctions.launchToUrl(Uri.parse(item.website!));
      },
      child: StyledCard(
        height: context.isDesktop ? expHeight : expMobileHeight,
        width: expWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.company,
              style: context.textStyle.titleSmBold.copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            Gap(context.insets.verticalPadding),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildExpItemContent(data: item.title),
                  Gap(context.insets.verticalPadding),
                  BuildExpItemContent(data: item.period),
                  Gap(context.insets.verticalPadding),
                  BuildExpItemContent(data: item.location),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: IconButton(
                onPressed: () async {
                  await HelperFunctions.launchToUrl(Uri.parse(item.website!));
                },
                icon: const Icon(FontAwesomeIcons.globe, color: AppColors.primary200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildExpItemContent extends StatelessWidget {
  final String data;
  const BuildExpItemContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: context.theme.colorScheme.onBackground),
        const Gap(6),
        Expanded(
          child: Text(
            data,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
