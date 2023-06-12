import 'package:flutter/material.dart';

class MoveButton extends StatefulWidget {
  const MoveButton({Key? key, this.icon, this.color, this.onTap, }) : super(key: key);
  final IconData? icon;
  final Color? color;
  final void Function()? onTap;

  @override
  State<MoveButton> createState() => _MoveButtonState();
}

class _MoveButtonState extends State<MoveButton> {
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
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 5)
          ],
        ),
        child: CircleAvatar(
          backgroundColor: _onHover ? Theme.of(context).colorScheme.primary : widget.color ?? Colors.white,
          radius: 40,
          child: Icon(
            widget.icon,
            color: _onHover ? Colors.white : Colors.black,
            size: 40,
          ),
        ),
      ),
    );
  }
}