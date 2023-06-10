import 'package:flutter/material.dart';

import '../config/app_padding.dart';
import '../config/app_space.dart';
import '../config/app_text_style.dart';
import '../config/layout_dimensions.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutDimensions.sectionTitleHeight,
      alignment: Alignment.center,
      padding: AppPadding.hXXL!,
      child: Row(
        children: [
          Text(title, style: AppTextStyle.h5b,),
          AppSpace.hL!,
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 90,
            height: 5,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16)
            ),
          )
        ],
      ),
    );
  }
}
