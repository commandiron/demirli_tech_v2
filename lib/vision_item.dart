import 'package:flutter/material.dart';

import 'app_text.dart';

class VisionItem extends StatelessWidget {
  const VisionItem({Key? key, required this.title, this.onTap}) : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: AppCard(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  height: 60,
                  width: 60,
                  title: "?",
                )
              ),
              const VerticalDivider(color: Colors.white,),
              const Align(
                alignment: Alignment.bottomCenter,
                child: AppCard(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  height: 60,
                  width: 60,
                  title: "?",
                )
              ),
            ],
          ),
        ),
        AppCard(
          shape: BoxShape.circle,
          height: 120,
          width: 120,
          title: title,
        )
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({Key? key, this.shape = BoxShape.rectangle, this.borderRadius, required this.height, required this.width, required this.title}) : super(key: key);

  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final double width;
  final String title;

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
      child: AppText(text: title, fontSize: 20,),
    );
  }
}