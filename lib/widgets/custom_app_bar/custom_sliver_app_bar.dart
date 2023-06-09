import 'package:flutter/material.dart';

import '../../config/layout_dimensions.dart';
import '../../ui_model/body_section.dart';
import 'app_bar_text_button.dart';
import '../app_logo.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.bodySections, required this.onAppLogoPressed, required this.onButtonPressed, }) : super(key: key);

  final List<BodySection> bodySections;
  final void Function() onAppLogoPressed;
  final void Function(int sectionIndex) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: true,
      toolbarHeight: LayoutDimensions.appBarHeight,
      leading: AppLogo(
        logoAsset: "assets/images/app_logo/demirli_tech_text_logo_black.png",
        onTap: onAppLogoPressed
      ),
      leadingWidth: 300,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bodySections.where((item) => item.showInAppBar == true).map(
          (e) => AppBarTextButton(
            text: e.title ?? "",
            onPressed: () {
              onButtonPressed(e.index);
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
