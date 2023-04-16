import 'package:flutter/material.dart';

import '../config/app_padding.dart';
import '../config/app_space.dart';
import '../config/app_text_style.dart';

class BodyBase extends StatelessWidget {
  const BodyBase({Key? key, required this.height, required this.color, this.title, this.child,}) : super(key: key);

  final double height;
  final Color color;
  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        color: color,
        child: Column(
          children: [
            if(title != null)
              Padding(
                padding: AppPadding.hXXL!.add(AppPadding.vXL!),
                child: Row(
                  children: [
                    Text(title!.toUpperCase(), style: AppTextStyle.h5b,),
                    AppSpace.hL!,
                    Container(
                      width: 70,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16)
                      ),
                    )
                  ],
                ),
              ),
            if(child != null)
              child!
          ],
        )
    );
  }
}