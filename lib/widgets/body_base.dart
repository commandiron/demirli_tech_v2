import 'package:flutter/material.dart';

class BodyBase extends StatelessWidget {
  const BodyBase({Key? key, required this.height, required this.bgColor, this.bgImageAsset, this.child,}) : super(key: key);

  final double height;
  final Color bgColor;
  final String? bgImageAsset;
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
      child: child!
    );
  }
}