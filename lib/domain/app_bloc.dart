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
      add(InitWelcomeAnimation());

      final productsOffset = BodySection.getItems(event.context)[1].offset;
      state.appScrollController.addListener(() {
        if(state.appScrollController.offset > productsOffset / 1.2
            && state.productsAnimationState is ProductsAnimationInitial
        ) {
          add(InitProductsAnimation());
        }
      });
    });
    on<InitWelcomeAnimation>((event, emit) async {
      await Future.delayed(Duration(milliseconds: state.welcomeAnimationState.animationDelay));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepOne()));
      await Future.delayed(Duration(milliseconds: state.welcomeAnimationState.stepOneToTwoAnimationDelay));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepTwo()));
    });
    on<InitProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepOne()));
      await Future.delayed(Duration(milliseconds: state.productsAnimationState.stepOneToTwoAnimationDelayInMillis));
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepTwo()));
    });
    on<AppBarLeadingTap>((event, emit) {
      navigateToSection(event.context, 0);
    });
    on<AppBarButtonTap>((event, emit) {
      navigateToSection(event.context, event.index);
    });
    on<WelcomeButtonPressed>((event, emit) {
      navigateToSection(event.context, 1);
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

  void navigateToSection(BuildContext context, index) {
    final double offset = BodySection.getItems(context).firstWhere((element) => element.index == index).offset;
    state.appScrollController.animateTo(
        state.appScrollController.offset < offset
            ? offset + LayoutDimensions.appBarHeight
            : offset,
        duration: const Duration(seconds: 1),
        curve: Curves.ease
    );
  }
}
