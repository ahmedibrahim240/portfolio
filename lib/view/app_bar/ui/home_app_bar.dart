import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/view/app_bar/data/models/app_menu_models.dart';
import 'package:my_portfolio/view/app_bar/ui/app_menu.dart';
import 'package:my_portfolio/view/app_bar/ui/theme_toggle.dart';

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
                Text('Ahmed Ibranim', style: context.textStyle.heading2),
                const Spacer(),
                if (context.isDesktop)
                  ...AppMenuModel.menuList.map(
                    (e) =>
                        MenuItem(onTap: () {}, title: e.title, isSelected: e.index == 0),
                  ),
                const Spacer(),
                const ThemeToggle(),
                if (!context.isDesktop) const AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) const DrawerMenu(),
      ],
    );
  }
}
