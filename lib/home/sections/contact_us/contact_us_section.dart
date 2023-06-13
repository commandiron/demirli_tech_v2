import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:flutter/material.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({Key? key}) : super(key: key);

  static const index = 4;
  static const title = "Bize ulaşın";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hL!.add(AppPadding.vXL!),
      child: Column(
        children: [
          Image.asset("assets/images/app_logo/demirli_tech_text_logo_white.png")
        ],
      ),
    );
  }
}
