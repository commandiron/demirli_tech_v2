import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/layout_dimensions.dart';
import '../ui_model/body_section.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(
    AppState(
      appScrollController: ScrollController(),
      productsCarouselController: CarouselController(),
      uiState: UiState(
        welcomeButtonIcon: Icons.arrow_forward_ios,
      ),
      welcomeAnimationState: WelcomeAnimationInitial(),
      productsAnimationState: ProductsAnimationInitial()
    )
  ) {
    on<InitAppAnimations>((event, emit) {
      add(StartWelcomeAnimation());

      final productsOffset = BodySection.getItems(event.context)[1].offset;
      state.appScrollController.addListener(() {
        if(state.appScrollController.offset > productsOffset / 1.2
            && state.productsAnimationState is ProductsAnimationInitial
        ) {
          add(StartProductsAnimation());
        }
      });
    });
    on<StartWelcomeAnimation>((event, emit) async {
      await Future.delayed(Duration(seconds: state.welcomeAnimationState.animationDelayInSecond));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepOne()));
      await Future.delayed(Duration(seconds: state.welcomeAnimationState.stepOneToTwoAnimationDelayInSecond));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepTwo()));
    });
    on<OnWelcomeButtonHover>((event, emit) async {
      if(event.value) {
        emit(state.copyWith(uiState: state.uiState.copyWith(welcomeButtonIcon: Icons.arrow_downward_outlined)));
      } else {
        emit(state.copyWith(uiState: state.uiState.copyWith(welcomeButtonIcon: Icons.arrow_forward_ios)));
      }
    });
    on<StartProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepOne()));
      await Future.delayed(Duration(seconds: state.productsAnimationState.stepOneToTwoAnimationDelayInSecond));
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepTwo()));
    });
    on<NavigateSection>((event, emit) {
      final double offset = BodySection.getItems(event.context).firstWhere((element) => element.index == event.index).offset;
      state.appScrollController.animateTo(
          state.appScrollController.offset < offset
              ? offset + LayoutDimensions.appBarHeight
              : offset,
          duration: const Duration(seconds: 1),
          curve: Curves.ease
      );
    });
    on<ProductsCarouselBack>((event, emit) {
      state.productsCarouselController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
    on<ProductsCarouselNext>((event, emit) {
      state.productsCarouselController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
      );
    });
  }
}
