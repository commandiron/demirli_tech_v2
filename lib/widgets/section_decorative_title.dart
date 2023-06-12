import 'package:flutter/material.dart';

import '../config/app_text_style.dart';

class SectionDecorativeTitle extends StatelessWidget {
  const SectionDecorativeTitle({Key? key, required this.title, required this.decorativeTitleAnimationDuration, required this.decorativeTitleContainerHeight}) : super(key: key);

  final String title;
  final int decorativeTitleAnimationDuration;
  final double decorativeTitleContainerHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: decorativeTitleAnimationDuration),
      height: decorativeTitleContainerHeight,
      alignment: Alignment.topRight,
      child: Text(title, style: AppTextStyle.h1!.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = Colors.grey.shade200,
          fontSize: 200,
      ),
      ),
    );
  }
}
