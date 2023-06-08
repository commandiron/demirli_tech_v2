import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/layout_dimensions.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(
    AppState(
      controller: ScrollController(),
      isAppBarTransparent: false
    )
  );

  void onAppLogoPressed() {
    state.controller.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.ease);
  }
  void onAppBarButtonPressed(double offset) {
    state.controller.animateTo(
      state.controller.offset < offset
        ? offset + LayoutDimensions.appBarHeight
        : offset,
      duration: const Duration(seconds: 1),
      curve: Curves.ease
    );
  }
}