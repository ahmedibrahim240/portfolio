import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/home/widget/app_bar/data/models/app_menu_models.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/app_menu.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/theme_toggle.dart';

import 'app_bar_drawer_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogo(),
                const Spacer(),
                if (context.isDesktop) const DiskTopMenu(),
                const Spacer(),
                const ThemeToggle(),
                if (!context.isDesktop) const AppBarDrawerIcon(),
                // const Spacer(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) const DrawerMenu(),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Ahmed Ibranim', style: context.textStyle.heading2);
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
