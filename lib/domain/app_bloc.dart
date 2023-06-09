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
      await Future.delayed(const Duration(seconds: 1));
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: WelcomeAnimationStepOne(),
          productsAnimationState: state.productsAnimationState
        )
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: WelcomeAnimationStepTwo(),
          productsAnimationState: state.productsAnimationState
        )
      );
    });
    on<StartProductsAnimation>((event, emit) async {
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: state.welcomeAnimationState,
          productsAnimationState: ProductsAnimationStepOne()
        )
      );
      await Future.delayed(const Duration(milliseconds: 500));
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: state.welcomeAnimationState,
          productsAnimationState: ProductsAnimationStepTwo()
        )
      );
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
