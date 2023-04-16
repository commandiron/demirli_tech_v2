import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../screens/home_screen.dart';
import 'app_text_button.dart';
import 'demirli_tech_logo.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.onLeadingTap, required this.onButtonTap}) : super(key: key);

  final void Function() onLeadingTap;
  final void Function(double offset) onButtonTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: true,
      toolbarHeight: Constants.appBarHeight,
      backgroundColor: Colors.white,
      leading:  AppLogo(
        onTap: () => onLeadingTap()
      ),
      leadingWidth: 300,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: BodySection.getItems(context).where((item) => item.showButton == true).map(
          (e) => AppTextButton(
            text: e.title,
            onPressed: () {
              onButtonTap(e.offset + Constants.appBarHeight);
            },
          ),
        ).toList()
      ),
      actions: const [
        SizedBox(width: 300,)
      ],
    );
  }
}
