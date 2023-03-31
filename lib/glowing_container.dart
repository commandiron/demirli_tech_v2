import 'package:flutter/material.dart';

class GlowingContainer extends StatelessWidget {
  const GlowingContainer(
      {
        Key? key,
        this.shape = BoxShape.rectangle,
        this.borderRadius,
        required this.height,
        required this.width,
        required this.child,
      }
      ) : super(key: key);

  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        shape: shape,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          )
        ]
      ),
      height: height,
      width: width,
      alignment: Alignment.center,
      child: child,
    );
  }
}