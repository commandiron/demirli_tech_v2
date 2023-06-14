import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/config/assets.dart';
import 'package:demirli_tech_v2/home/sections/our_vision/our_vision_section.dart';
import 'package:flutter/material.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({Key? key}) : super(key: key);

  static const index = 4;
  static const title = "Bize ulaşın";
  static const double height = 360;
  static double calculateOffset(BuildContext context) {
    return OurVisionSection.calculateOffset(context) + OurVisionSection.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: AppPadding.hL!.add(AppPadding.vXL!),
        child: Column(
          children: [
            Image.asset(Assets.appLogoWhite)
          ],
        ),
      ),
    );
  }
}
