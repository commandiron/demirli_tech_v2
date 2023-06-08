import 'package:flutter/material.dart';

import '../../config/layout_dimensions.dart';
import '../../ui_model/body_section.dart';
import 'app_bar_text_button.dart';
import '../app_logo.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.bodySections, required this.isAppBarTransparent, required this.onAppLogoPressed, required this.onButtonPressed, }) : super(key: key);

  final List<BodySection> bodySections;
  final bool isAppBarTransparent;
  final void Function() onAppLogoPressed;
  final void Function(double offset) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: true,
      toolbarHeight: LayoutDimensions.appBarHeight,
      leading: AppLogo(
        logoAsset: isAppBarTransparent
          ? "assets/images/app_logo/demirli_tech_text_logo_white.png"
          : "assets/images/app_logo/demirli_tech_text_logo_black.png",
        onTap: onAppLogoPressed
      ),
      leadingWidth: 300,
      backgroundColor: isAppBarTransparent ? Colors.transparent : null,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bodySections.where((item) => item.showInAppBar == true).map(
          (e) => AppBarTextButton(
            text: e.title ?? "",
            color: isAppBarTransparent ? Colors.white : null,
            onPressed: () {
              onButtonPressed(e.offset);
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
