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

class HeroImageAnmatied extends StatefulWidget {
  const HeroImageAnmatied({super.key});

  @override
  State<HeroImageAnmatied> createState() => _HeroImageAnmatiedState();
}

class _HeroImageAnmatiedState extends State<HeroImageAnmatied>
    with SingleTickerProviderStateMixin {
  double aspectRatio = 10000;
  @override
  void initState() {
    super.initState();
    aspectRatio = 1000;
  }

  void _preloadImage() async {
    try {
      await precacheImage(AssetImage(kAboutMe.image), context).then((onValue) {
        debugPrint("_preloadImage 👌");
      });
    } catch (e) {
      debugPrint("_preloadImage error :$e");
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        aspectRatio = .6;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImage();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: AspectRatio(
        aspectRatio: .6,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: const BorderRadiusGeometry.all(Radius.circular(250)),
            image: DecorationImage(image: AssetImage(kAboutMe.image), fit: BoxFit.cover),
          ),
          // child: ClipRRect(child: Image.asset(kAboutMe.image, )),
        ),
      ),
    );
  }
}
