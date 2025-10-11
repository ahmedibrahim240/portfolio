import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helper/extensions.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderEffect = true,
    required this.child,
    this.borderEffectSized = 60,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;
  final double borderEffectSized;
  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          _BorderShadow(widget.borderEffectSized),
          Positioned(bottom: 0, right: 0, child: _BorderShadow(widget.borderEffectSized)),
        ],
        Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.colorScheme.outline),
            color: context.theme.colorScheme.surface,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          ),
          child: widget.child,
        ),
        if (widget.borderEffect) ...[
          CustomPaint(
            size: Size(widget.width ?? 0, widget.height ?? 0),
            painter: CurvedLinePainter(
              color: context.theme.colorScheme.primary,
              lineSize: widget.borderEffectSized,
            ),
          ),
          // const Positioned(bottom: 0, right: 0, child: _BorderShadow()),
        ],
      ],
    );
  }
}

class _BorderShadow extends StatelessWidget {
  final double sized;
  const _BorderShadow(this.sized);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sized,
      height: sized,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.primary.withValues(alpha: .5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;
  final double lineSize;
  CurvedLinePainter({super.repaint, required this.color, required this.lineSize});
  @override
  void paint(Canvas canvas, Size size) {
    final toLeftPaint = Paint()
      ..shader = LinearGradient(
        colors: [color.withValues(alpha: 0), color, color.withValues(alpha: 0)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, lineSize, lineSize))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final bottomRightPaint = Paint()
      ..shader =
          LinearGradient(
            colors: [color.withValues(alpha: 0), color, color.withValues(alpha: 0)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);
    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );
    canvas.drawPath(path, toLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => true;
}
