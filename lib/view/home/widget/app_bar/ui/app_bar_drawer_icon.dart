import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/drawer_menu_cubit.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/cubit/drawer_menu_state.dart';

class AppBarDrawerIcon extends StatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  State<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends State<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    isOpen = false;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
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
      child: Container(
        alignment: AlignmentDirectional.topCenter,
        child: IconButton(
          icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animation),
          onPressed: () {
            context.read<DrawerMenuCubit>().changeDrawerState(!isOpen);
            isOpen = !isOpen;

            setState(() {});
          },
        ),
      ),
    );
  }
}
