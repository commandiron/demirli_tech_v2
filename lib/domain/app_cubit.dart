import 'package:demirli_tech_v2/ui_model/body_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/layout_dimensions.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(
    AppState(
      controller: ScrollController(),
      welcomeAnimationAttr: WelcomeAnimationAttr(
        textOpacity: 0,
        buttonOpacity: 0
      )

    )
  );

  void animateToSection(BuildContext context, int sectionIndex) {
    final double offset = BodySection.getItems(context).firstWhere((element) => element.index == sectionIndex).offset;
    state.controller.animateTo(
        state.controller.offset < offset
            ? offset + LayoutDimensions.appBarHeight
            : offset,
        duration: const Duration(seconds: 1),
        curve: Curves.ease
    );
  }

  Future<void> startWelcomeAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
  }
}