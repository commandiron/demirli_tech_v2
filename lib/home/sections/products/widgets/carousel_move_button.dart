import 'package:flutter/material.dart';

class CarouselMoveButton extends StatefulWidget {
  const CarouselMoveButton({Key? key, this.icon, this.onTap}) : super(key: key);
  final IconData? icon;
  final void Function()? onTap;

  @override
  State<CarouselMoveButton> createState() => _CarouselMoveButtonState();
}

class _CarouselMoveButtonState extends State<CarouselMoveButton> {
  bool _onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          _onHover = value;
        });
      },
      child: CircleAvatar(
        backgroundColor: _onHover ? Theme.of(context).colorScheme.primary : Colors.white,
        minRadius: 40,
        child: Icon(
          widget.icon,
          color: _onHover ? Colors.white : Colors.black,
          size: 40,
        ),
      ),
    );
  }
}

class CarouselNextButton extends StatelessWidget {
  const CarouselNextButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CarouselMoveButton(
      icon: Icons.navigate_next,
      onTap: onTap,
    );
  }
}

class CarouselBackButton extends StatelessWidget {
  const CarouselBackButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CarouselMoveButton(
      icon: Icons.navigate_before,
      onTap: onTap,
    );
  }
}
