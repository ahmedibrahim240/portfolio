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

class MenuItem extends StatefulWidget {
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
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(MenuItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = widget.isSelected
        ? context.theme.colorScheme.onBackground
        : context.theme.colorScheme.onSurface;
    final Color hoverColor = context.theme.primaryColor;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        if (!widget.isSelected) {
          _animationController.reverse();
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.medSized,
                  vertical: AppSize.xsSized,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _isHovered || widget.isSelected
                          ? hoverColor
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  widget.title,
                  style: SmallTextStyles().titleSmBold.copyWith(
                    color: _isHovered ? hoverColor : defaultColor,
                    fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w400,
                    letterSpacing: _isHovered ? 0.5 : 0.0,
                  ),
                ),
              ),
            );
          },
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
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubitCubit, ScrollCubitState>(
      builder: (context, state) {
        final ScrollCubitCubit scrollCubit = context.read<ScrollCubitCubit>();
        return Column(
          children: AppMenuModel.menuList.asMap().entries.map((entry) {
            final index = entry.key;
            final e = entry.value;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
                  child: SlideTransition(
                    position:
                        Tween<Offset>(
                          begin: const Offset(-0.5, 0),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
                        ),
                    child: child,
                  ),
                );
              },
              child: Padding(
                key: ValueKey<int>(index),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MenuItem(
                  onTap: () {
                    scrollCubit.scrollToSection(e.path);
                    context.read<DrawerMenuCubit>().changeDrawerState(false);
                  },
                  isSelected: e.path == scrollCubit.currentsctionPath,
                  title: e.title,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
