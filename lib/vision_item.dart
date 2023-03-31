import 'package:flutter/material.dart';

import 'app_text.dart';
import 'glowing_container.dart';

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
                child: InkWell(
                  onTap: onTap,
                  child: AppCard()
                )
              ),
              VerticalDivider(color: Colors.white,),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppCard()
              ),
            ],
          ),
        ),
        GlowingContainer(
          shape: BoxShape.circle,
          height: 120,
          width: 120,
          child: AppText(text: title, fontSize: 20,),
        )
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GlowingContainer(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      height: 60,
      width: 60,
      child: AppText(text: "?", fontSize: 20,),
    );
  }
}