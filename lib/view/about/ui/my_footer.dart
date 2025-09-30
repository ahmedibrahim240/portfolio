import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/widget/powered_by_flutter.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/app_menu.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.cardPadding),
      child: Column(
        children: [
          context.isDesktop ? const _DeskTopFooter() : const _MobileFooter(),
          const Divider(height: 24),
          const PoweredByFlutter(),
        ],
      ),
    );
  }
}

class _DeskTopFooter extends StatelessWidget {
  const _DeskTopFooter();

  @override
  Widget build(BuildContext context) {
    return const Row(children: [AppLogo(), Spacer(), DiskTopMenu(), Spacer()]);
  }
}

class _MobileFooter extends StatelessWidget {
  const _MobileFooter();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [AppLogo(), MobileMenu()]);
  }
}
