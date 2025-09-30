import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    required this.child,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.colorScheme.outline),
        color: context.theme.colorScheme.surface,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
      ),
      child: widget.child,
    );
  }
}
