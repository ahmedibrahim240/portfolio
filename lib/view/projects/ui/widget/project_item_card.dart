// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/themes/app_colors.dart';
import 'package:my_portfolio/core/widget/app_text.dart';

import '../../data/projects_models.dart';

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
          AspectRatio(aspectRatio: 1.5, child: Container(color: Colors.amber)),
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
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: scrollController,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                            childAspectRatio: .1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20, // Aspect ratio of each grid item
                          ),
                          itemCount: project.technologies.length,
                          itemBuilder: (_, index) {
                            String item = project.technologies[index];
                            return AppText(
                              "• $item",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.bodyMdMedium.copyWith(
                                color: AppColors.primary200,
                              ),
                            );
                          },
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

class ProjectItemCardMoble extends StatelessWidget {
  final ProjectModels project;
  const ProjectItemCardMoble({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(aspectRatio: 1.5, child: Container(color: Colors.amber)),
          const Gap(24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  if (context.isMobile) ...[
                    AppText(
                      project.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: context.textStyle.bodyLgBold.copyWith(
                        color: context.theme.colorScheme.onBackground,
                      ),
                    ),
                    const Gap(8),
                    AppText(
                      project.period,
                      textAlign: TextAlign.start,

                      style: context.textStyle.bodyLgMedium.copyWith(
                        color: context.theme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                  Visibility(
                    visible: context.isTablet,
                    child: Row(
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
                        trackColor: WidgetStateProperty.all(
                          AppColors.primary200.withValues(alpha: .23),
                        ),
                        thumbColor: WidgetStateProperty.all(
                          AppColors.primary200.withValues(alpha: .23),
                        ),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        thickness: 6.0,
                        radius: const Radius.circular(10),
                        controller: scrollController,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // Number of columns
                            childAspectRatio: 10,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20, // Aspect ratio of each grid item
                          ),
                          controller: scrollController,
                          itemCount: project.technologies.length,
                          itemBuilder: (_, index) {
                            String item = project.technologies[index];
                            return AppText(
                              "• $item",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.bodyMdMedium.copyWith(
                                color: AppColors.primary200,
                              ),
                            );
                          },
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
