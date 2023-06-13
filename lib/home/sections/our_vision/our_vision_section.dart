import 'package:demirli_tech_v2/widgets/section_title.dart';
import 'package:flutter/material.dart';

class OurVisionSection extends StatelessWidget {
  const OurVisionSection({Key? key}) : super(key: key);

  static const index = 3;
  static const title = "Vizyonumuz";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: title.toUpperCase()),
      ],
    );
  }
}
