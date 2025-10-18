// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/themes/app_text_style.dart';
import 'package:my_portfolio/view/home/widget/app_bar/data/models/app_menu_models.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/drawer_menu_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/drawer_menu_state.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const MenuItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.medSized,
          vertical: AppSize.xsSized,
        ),
        child: Text(
          title,

          style: SmallTextStyles().titleSmBold.copyWith(
            color: isSelected
                ? context.theme.colorScheme.onBackground
                : context.theme.colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w200,
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    context.read<DrawerMenuCubit>().changeDrawerState(false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerMenuCubit, DrawerMenuState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          open: () {
            _controller.forward();
          },
          close: () {
            _controller.reverse();
          },
        );
      },
      child: ClipRRect(
        child: SlideTransition(
          position: _animation,
          child: Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.surface.withValues(alpha: 0.4),
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
              ],
            ),
            child: const MobileMenu(),
          ),
        ),
      ),
    );
  }
}

class MobileMenu extends StatelessWidget {
  final bool isFromFooter;
  const MobileMenu({super.key, this.isFromFooter = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubitCubit, ScrollCubitState>(
      builder: (context, state) {
        final ScrollCubitCubit scrollCubit = context.read<ScrollCubitCubit>();
        final drawerCubit = context.read<DrawerMenuCubit>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AppMenuModel.menuList
              .map(
                (e) => MenuItem(
                  onTap: () {
                    scrollCubit.scrollToSection(e.path);
                    if (!isFromFooter) {
                      drawerCubit.changeDrawerState(false); // Close drawer
                    }
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
