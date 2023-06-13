import 'package:demirli_tech_v2/domain/bloc/app_bloc.dart';
import 'package:demirli_tech_v2/domain/bloc/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/layout_dimensions.dart';
import 'app_bar_text_button.dart';
import '../app_logo.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({Key? key, required this.onLeadingTap, required this.onButtonTap, }) : super(key: key);

  final void Function() onLeadingTap;
  final void Function(int sectionIndex) onButtonTap;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        return previous.welcomeAnimationState.appBarOpacity != current.welcomeAnimationState.appBarOpacity;
      },
      builder: (context, state) {
        return SliverAppBar(
          pinned: false,
          snap: false,
          floating: true,
          toolbarHeight: LayoutDimensions.appBarHeight,
          leading: AnimatedOpacity(
            opacity: state.welcomeAnimationState.appBarOpacity,
            duration: const Duration(milliseconds: 1000),
            child: AppLogo(
                logoAsset: "assets/images/app_logo/demirli_tech_text_logo_black.png",
                onTap: widget.onLeadingTap
            ),
          ),
          leadingWidth: 300,
          elevation: 0,
          title: AnimatedOpacity(
            opacity: state.welcomeAnimationState.appBarOpacity,
            duration: const Duration(milliseconds: 1000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.bodySections.where((item) => item.showInAppBar == true).map(
                (bodySection) => AppBarTextButton(
                  text: bodySection.title,
                  onPressed: () {
                    widget.onButtonTap(bodySection.index);
                  },
                ),
              ).toList()
            ),
          ),
          actions: const [
            SizedBox(width: 300,)
          ],
        );
      },
    );
  }
}
