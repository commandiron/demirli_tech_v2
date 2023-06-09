import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBarTextButton extends StatefulWidget {
  const AppBarTextButton({Key? key, required this.text, this.color, this.onPressed,}) : super(key: key);

  final String text;
  final Color? color;
  final void Function()? onPressed;

  @override
  State<AppBarTextButton> createState() => _AppBarTextButtonState();
}

class _AppBarTextButtonState extends State<AppBarTextButton> {

  bool _isOnHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
          onTap: () {
            if(widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          onHover: (value) {
            setState(() {
              _isOnHover = value;
            });
          },
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: IntrinsicWidth(
            child: Column(
              children: [
                const Divider(color: Colors.transparent),
                Text(
                  widget.text,
                  style: AppTextStyle.b2!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: widget.color
                  )
                ),
                AnimatedOpacity(
                    opacity: _isOnHover ? 1 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 3,)
                )
              ],
            ),
          )
      ),
    );
  }
}