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
      welcomeButtonIcon: Icons.arrow_forward_ios,
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
          welcomeButtonIcon: state.welcomeButtonIcon,
          productsAnimationState: state.productsAnimationState
        )
      );
      await Future.delayed(const Duration(seconds: 1));
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: WelcomeAnimationStepTwo(),
          welcomeButtonIcon: state.welcomeButtonIcon,
          productsAnimationState: state.productsAnimationState
        )
      );
    });
    on<OnWelcomeButtonHover>((event, emit) async {
      if(event.value) {
        emit(
          AppState(
            appScrollController: state.appScrollController,
            productsCarouselController: state.productsCarouselController,
            welcomeAnimationState: state.welcomeAnimationState,
            welcomeButtonIcon: Icons.arrow_downward_outlined,
            productsAnimationState: state.productsAnimationState
          )
        );
      } else {
        emit(
          AppState(
            appScrollController: state.appScrollController,
            productsCarouselController: state.productsCarouselController,
            welcomeAnimationState: state.welcomeAnimationState,
            welcomeButtonIcon: Icons.arrow_forward_ios,
            productsAnimationState: state.productsAnimationState
          )
        );
      }
    });
    on<StartProductsAnimation>((event, emit) async {
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: state.welcomeAnimationState,
          welcomeButtonIcon: state.welcomeButtonIcon,
          productsAnimationState: ProductsAnimationStepOne()
        )
      );
      emit(
        AppState(
          appScrollController: state.appScrollController,
          productsCarouselController: state.productsCarouselController,
          welcomeAnimationState: state.welcomeAnimationState,
          welcomeButtonIcon: state.welcomeButtonIcon,
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
