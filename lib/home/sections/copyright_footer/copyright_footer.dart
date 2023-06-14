import 'package:demirli_tech_v2/home/sections/contact_us/contact_us_section.dart';
import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({Key? key}) : super(key: key);

  static const index = 5;
  static const title = "Copyright Footer";
  static const double height = 60;

  static double getCopyrightFooterOffset(BuildContext context) {
    return ContactUsSection.calculateOffset(context) + ContactUsSection.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        border: Border.all(
          color: Colors.grey,
          width: 0.2
        )
      ),
    );
  }
}
