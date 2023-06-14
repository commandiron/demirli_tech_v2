import 'package:demirli_tech_v2/home/sections/about/about_section.dart';
import 'package:demirli_tech_v2/widgets/section_title.dart';
import 'package:flutter/material.dart';

class OurVisionSection extends StatelessWidget {
  const OurVisionSection({Key? key}) : super(key: key);

  static const index = 3;
  static const title = "Vizyonumuz";
  static const double height = 600;
  static double calculateOffset(BuildContext context) {
    return AboutSection.calculateOffset(context) + AboutSection.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Column(
        children: [
          SectionTitle(title: title.toUpperCase()),
        ],
      ),
    );
  }
}
