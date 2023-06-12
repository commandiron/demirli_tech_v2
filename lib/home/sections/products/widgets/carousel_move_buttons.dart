import 'package:flutter/material.dart';

import '../../../../widgets/move_button.dart';

class CarouselNextButton extends StatelessWidget {
  const CarouselNextButton({Key? key, this.color, this.onTap, }) : super(key: key);
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MoveButton(
      icon: Icons.navigate_next,
      color: color,
      onTap: onTap,
    );
  }
}

class CarouselBackButton extends StatelessWidget {
  const CarouselBackButton({Key? key,  this.color, this.onTap,}) : super(key: key);
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MoveButton(
      icon: Icons.navigate_before,
      color: color,
      onTap: onTap,
    );
  }
}
