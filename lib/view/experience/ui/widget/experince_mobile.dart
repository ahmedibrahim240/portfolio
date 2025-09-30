import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
import 'package:my_portfolio/view/experience/ui/widget/experince_desktop.dart';

class ExperinceMobile extends StatelessWidget {
  const ExperinceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: kAboutMe.experiences.map((item) {
          return Column(
            children: [
              ExperineceItem(item: item),
              if (kAboutMe.experiences.indexOf(item) != kAboutMe.experiences.length - 1)
                const SizedBox(
                  height: 60,
                  child: DottedLine(dashColor: Colors.white, direction: Axis.vertical),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
