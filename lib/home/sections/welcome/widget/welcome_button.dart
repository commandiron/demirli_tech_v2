import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_space.dart';
import '../../../../config/app_text_style.dart';
import '../../../../domain/app_bloc.dart';
import '../../../../domain/app_event.dart';

class WelcomeButton extends StatefulWidget {
  const WelcomeButton({Key? key}) : super(key: key);

  @override
  State<WelcomeButton> createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton> {

  IconData _icon =  Icons.arrow_right;
  bool pressedRecently = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          pressedRecently = true;
          context.read<AppBloc>().add(NavigateSection(context, 1));
        },
        onHover: (value) async {
          if(value) {
            setState(() {
              _icon = Icons.arrow_drop_down;
            });
          } else {
            if(pressedRecently) {
              await Future.delayed(const Duration(seconds: 1));
              pressedRecently = false;
            }
            setState(() {
              _icon = Icons.arrow_right;
            });
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Keşfet", style: AppTextStyle.h5,),
            AppSpace.hL!,
            Icon(_icon, size: 32,)
          ],
        )
    );
  }
}
