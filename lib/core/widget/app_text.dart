import 'package:flutter/material.dart';
// import 'package:seo_renderer/seo_renderer.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  // final TextRendererStyle? textRendererStyle;
  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    // this.textRendererStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style, textAlign: textAlign);
  }
}
