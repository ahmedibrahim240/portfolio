// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';
import 'package:my_portfolio/core/widget/app_text.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';

class ProjectItemCard extends StatelessWidget {
  final ProjectModels project;
  const ProjectItemCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: Visibility(
              visible: project.images.isNotEmpty,
              replacement: Container(color: Colors.amber),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: .3,

                  enlargeCenterPage: true,
                  autoPlay: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  enableInfiniteScroll: true,
                  disableCenter: true,
                ),
                items: project.images.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    child: SvgPicture.asset(image, fit: BoxFit.cover),
                    // child: Image(
                    //   image: AssetImage(image),
                    //   filterQuality: FilterQuality.high,
                    //   isAntiAlias: true,
                    //   fit: BoxFit.fill,
                    // ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Gap(24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppText(
                          project.name,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyle.bodyLgBold.copyWith(
                            color: context.theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                      const Gap(8),
                      AppText(
                        project.period,
                        style: context.textStyle.bodyLgMedium.copyWith(
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Tooltip(
                    message: project.description ?? "No description available",
                    padding: const EdgeInsets.all(16),
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    textStyle: context.textStyle.bodyMdMedium.copyWith(
                      color: context.theme.colorScheme.onSurface,
                      height: 2,
                    ),
                    preferBelow: false,
                    verticalOffset: 20,
                    child: AppText(
                      project.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.theme.colorScheme.onSurface,
                        height: 2,
                      ),
                    ),
                  ),

                  const Gap(16),
                  Expanded(
                    child: ScrollbarTheme(
                      data: ScrollbarThemeData(
                        crossAxisMargin: -10,
                        mainAxisMargin: 50,
                        trackColor: WidgetStateProperty.all(Colors.transparent),
                        thumbColor: WidgetStateProperty.all(
                          AppColors.primary200.withValues(alpha: .23),
                        ),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        thickness: 6.0,
                        controller: scrollController,
                        radius: const Radius.circular(10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 6.0,
                              children: project.technologies.map((tech) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary200.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.primary200.withValues(alpha: 0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: AppText(
                                    tech,
                                    style: context.textStyle.bodySmMedium.copyWith(
                                      color: AppColors.primary200,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Gap(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.android)),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.apple_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class ProjectItemCardMoble extends StatelessWidget {
//   final ProjectModels project;
//   const ProjectItemCardMoble({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     ScrollController scrollController = ScrollController();
//     return Card(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(aspectRatio: 1.5, child: Container(color: Colors.amber)),
//           const Gap(24),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 children: [
//                   if (context.isMobile) ...[
//                     AppText(
//                       project.name,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.start,
//                       style: context.textStyle.bodyLgBold.copyWith(
//                         color: context.theme.colorScheme.onBackground,
//                       ),
//                     ),
//                     const Gap(8),
//                     AppText(
//                       project.period,
//                       textAlign: TextAlign.start,
//                       style: context.textStyle.bodyLgMedium.copyWith(
//                         color: context.theme.colorScheme.onBackground,
//                       ),
//                     ),
//                   ],
//                   Visibility(
//                     visible: context.isTablet,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           child: AppText(
//                             project.name,
//                             overflow: TextOverflow.ellipsis,
//                             style: context.textStyle.bodyLgBold.copyWith(
//                               color: context.theme.colorScheme.onBackground,
//                             ),
//                           ),
//                         ),
//                         const Gap(8),
//                         AppText(
//                           project.period,
//                           style: context.textStyle.bodyLgMedium.copyWith(
//                             color: context.theme.colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Gap(10),
//                   Tooltip(
//                     message: project.description ?? "No description available",
//                     padding: const EdgeInsets.all(16),
//                     constraints: const BoxConstraints(maxWidth: 400),
//                     decoration: BoxDecoration(
//                       color: context.theme.colorScheme.surface,
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     textStyle: context.textStyle.bodyMdMedium.copyWith(
//                       color: context.theme.colorScheme.onSurface,
//                       height: 2,
//                     ),
//                     preferBelow: false,
//                     verticalOffset: 20,
//                     child: AppText(
//                       project.description ?? "",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: context.textStyle.bodyMdMedium.copyWith(
//                         color: context.theme.colorScheme.onSurface,
//                         height: 2,
//                       ),
//                     ),
//                   ),

//                   const Gap(16),
//                   Expanded(
//                     child: LayoutBuilder(
//                       builder: (context, boxConst) {
//                         return SingleChildScrollView(
//                           controller: scrollController,
//                           scrollDirection: boxConst.maxHeight > 50
//                               ? Axis.horizontal
//                               : Axis.vertical,

//                           child: Align(
//                             alignment: AlignmentDirectional.topStart,
//                             child: Wrap(
//                               spacing: 6.0,
//                               runSpacing: 4.0,
//                               direction: boxConst.maxHeight > 50
//                                   ? Axis.horizontal
//                                   : Axis.vertical,
//                               children: project.technologies.map((tech) {
//                                 return Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8,
//                                     vertical: 4,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primary200.withValues(alpha: 0.1),
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(
//                                       color: AppColors.primary200.withValues(alpha: 0.3),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   child: AppText(
//                                     tech,
//                                     style: context.textStyle.bodySmMedium.copyWith(
//                                       color: AppColors.primary200,
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   const Gap(24),
//                   Align(
//                     alignment: AlignmentDirectional.centerEnd,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         IconButton(onPressed: () {}, icon: const Icon(Icons.android)),
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.apple_outlined),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
