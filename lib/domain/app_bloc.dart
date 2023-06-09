import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/layout_dimensions.dart';
import '../ui_model/body_section.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(
    AppState(
      controller: ScrollController(),
      welcomeAnimationState: WelcomeAnimationInitial()
    )
  ) {
    on<StartWelcomeAnimation>((event, emit) async {
      if(state.welcomeAnimationState is WelcomeAnimationInitial) {
        await Future.delayed(const Duration(seconds: 1));
        emit(
            AppState(
                controller: state.controller,
                welcomeAnimationState: WelcomeAnimationStepOne()
            )
        );
        await Future.delayed(const Duration(seconds: 1));
        emit(
            AppState(
                controller: state.controller,
                welcomeAnimationState: WelcomeAnimationStepTwo()
            )
        );
      }
    });
    on<NavigateSection>((event, emit) {
      final double offset = BodySection.getItems(event.context).firstWhere((element) => element.index == event.index).offset;
      state.controller.animateTo(
          state.controller.offset < offset
              ? offset + LayoutDimensions.appBarHeight
              : offset,
          duration: const Duration(seconds: 1),
          curve: Curves.ease
      );
    });
  }
}
