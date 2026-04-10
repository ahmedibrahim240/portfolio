import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/routing/routes.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
import 'package:my_portfolio/view/home/widget/app_bar/data/models/app_menu_models.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/app_menu.dart';

import 'app_bar_drawer_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollCubit = context.read<ScrollCubitCubit>();

    return ValueListenableBuilder<bool>(
      valueListenable: scrollCubit.isAppBarVisible,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: context.theme.appBarTheme.backgroundColor?.withValues(alpha: 0.1),
            height: context.insets.appBarHeight,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: context.insets.horizontalPadding,
              vertical: context.insets.verticalPadding,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogo(),
                  if (context.isDesktop) const DiskTopMenu(),
                  if (!context.isDesktop)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AppBarDrawerIcon(),
                        const SizedBox(width: 16),
                        ContactMeButton(scrollCubit: scrollCubit),
                      ],
                    ),
                  if (context.isDesktop) ContactMeButton(scrollCubit: scrollCubit),
                ],
              ),
            ),
          ),
          if (!context.isDesktop) const DrawerMenu(),
        ],
      ),
      builder: (context, isVisible, child) {
        return AnimatedSlide(
          duration: const Duration(milliseconds: 200),
          offset: isVisible ? Offset.zero : const Offset(0, -1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isVisible ? 1 : 0,
            child: IgnorePointer(ignoring: !isVisible, child: child),
          ),
        );
      },
    );
  }
}

class ContactMeButton extends StatefulWidget {
  final ScrollCubitCubit scrollCubit;
  const ContactMeButton({super.key, required this.scrollCubit});

  @override
  State<ContactMeButton> createState() => _ContactMeButtonState();
}

class _ContactMeButtonState extends State<ContactMeButton> {
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
            widget.scrollCubit.scrollToSection(AppRoutes.contact);
            // FirebaseAboutMeService firebaseAboutMeService = FirebaseAboutMeService();
            // await firebaseAboutMeService.uploadStructuredAboutMeData();
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text('About Me data uploaded successfully')),
            // );
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
          child: const FittedBox(fit: BoxFit.scaleDown, child: Text('Contact Me')),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(kAboutMe.fullName, style: context.textStyle.heading2);
  }
}

class DiskTopMenu extends StatelessWidget {
  const DiskTopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubitCubit, ScrollCubitState>(
      builder: (context, state) {
        final ScrollCubitCubit scrollCubit = context.read<ScrollCubitCubit>();
        return Row(
          children: AppMenuModel.menuList
              .map(
                (e) => MenuItem(
                  onTap: () {
                    scrollCubit.scrollToSection(e.path);
                  },
                  isSelected: e.path == scrollCubit.currentsctionPath,
                  title: e.title,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
