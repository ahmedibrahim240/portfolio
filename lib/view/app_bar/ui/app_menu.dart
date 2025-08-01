import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/themes/app_text_style.dart';
import 'package:my_portfolio/view/app_bar/data/models/app_menu_models.dart';
import 'package:my_portfolio/view/app_bar/logic/cubit/drawer_menu_cubit.dart';
import 'package:my_portfolio/view/app_bar/logic/cubit/drawer_menu_state.dart';

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
        child: Text(title, style: SmallTextStyles().bodyLgMedium),
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
            alignment: AlignmentDirectional.centerStart,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AppMenuModel.menuList
                  .map(
                    (e) =>
                        MenuItem(onTap: () {}, title: e.title, isSelected: e.index == 0),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
