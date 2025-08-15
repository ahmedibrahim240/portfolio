import 'package:flutter/material.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .6,
      child: ClipRRect(
        borderRadius: const BorderRadiusGeometry.all(Radius.circular(250)),
        child: Image.asset(kAboutMe.image, fit: BoxFit.cover),
      ),
    );
  }
}
