import 'package:flutter/material.dart';
import 'package:my_portfolio/view/app_bar/ui/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: Column(children: [HomeAppBar()])),
    );
  }
}
