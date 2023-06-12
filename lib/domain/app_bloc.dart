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
      productsAnimationState: ProductsAnimationInitial(),
      scrollToTopFabState: ScrollToTopFabStateHidden(),
    )
  ) {
    on<Init>((event, emit) {
      add(InitWelcomeAnimation());
      _initScrollAnimations(event.context);
    });
    on<ShowScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabStateVisible()));
    });
    on<HideScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabStateHidden()));
    });
    on<ScrollToTop>((event, emit) {
      _navigateToSection(event.context, 0);
    });
    on<InitWelcomeAnimation>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepOne()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepTwo()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepThree()));
    });
    on<InitProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepOne()));
      await Future.delayed(const Duration(milliseconds: 1200));
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepTwo()));
    });
    on<AppBarLeadingTap>((event, emit) {
      _navigateToSection(event.context, 0);
    });
    on<AppBarButtonTap>((event, emit) {
      _navigateToSection(event.context, event.index);
    });
    on<WelcomeButtonTap>((event, emit) {
      _navigateToSection(event.context, 1);
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

  void _initScrollAnimations(BuildContext context) {
    final productsOffset = BodySection.getItems(context)[1].offset;
    state.appScrollController.addListener(() {
      if(state.appScrollController.offset > 0
          && state.scrollToTopFabState is ScrollToTopFabStateHidden) {
        add(ShowScrollToTopFab());
      }
      if(state.appScrollController.offset == 0
          && state.scrollToTopFabState is ScrollToTopFabStateVisible) {
        add(HideScrollToTopFab());
      }
      if(state.appScrollController.offset > productsOffset / 1.2
          && state.productsAnimationState is ProductsAnimationInitial
      ) {
        add(InitProductsAnimation());
      }
    });
  }

  void _navigateToSection(BuildContext context, index) {
    final double currentOffset = state.appScrollController.offset;
    final double targetOffset = BodySection.getItems(context).firstWhere((element) => element.index == index).offset;
    state.appScrollController.animateTo(
      currentOffset < targetOffset
        ? targetOffset + LayoutDimensions.appBarHeight
        : targetOffset,
      duration: const Duration(seconds: 1),
      curve: Curves.ease
    );
  }
}
