import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/app_size.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

class BackgraundBlur extends StatelessWidget {
  const BackgraundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: -(context.width / 2 / 2),
      top: -(context.width / 2 / 2) + AppSize.xxxl,
      child: Container(
        height: context.height / 2 + AppSize.xxxl,
        width: context.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.primary.withValues(alpha: 0.4),
              spreadRadius: 200,
              blurRadius: 200,
            ),
          ],
        ),
      ),
    );
  }
}
