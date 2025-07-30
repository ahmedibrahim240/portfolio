import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

import '../../core/themes/cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Home Page', style: context.textStyle.titleSmBold),
            BlocBuilder<ThemeCubit, bool>(
              builder: (context, state) {
                return Switch.adaptive(
                  value: state,
                  onChanged: (value) {
                    context.read<ThemeCubit>().updateThemeMode(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
