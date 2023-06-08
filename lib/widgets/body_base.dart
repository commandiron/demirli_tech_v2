import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:flutter/material.dart';

import '../config/app_padding.dart';
import '../config/app_space.dart';
import '../config/app_text_style.dart';

class BodyBase extends StatelessWidget {
  const BodyBase({Key? key, required this.height, required this.bgColor, this.bgImageAsset, this.title, this.child, }) : super(key: key);

  final double height;
  final Color bgColor;
  final String? bgImageAsset;
  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          image: bgImageAsset != null
            ? DecorationImage(
              image: AssetImage(bgImageAsset!),
              fit: BoxFit.cover,
            )
            : null
        ),
        child: Column(
          children: [
            if(title != null)
              Container(
                height: LayoutDimensions.bodyBaseTitleHeight,
                alignment: Alignment.center,
                padding: AppPadding.hXXL!,
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