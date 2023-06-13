import 'package:carousel_slider/carousel_controller.dart';
import 'package:demirli_tech_v2/domain/bloc/state/products_animation_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/scroll_to_top_fab_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/welcome_animation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/layout_dimensions.dart';
import '../model/body_section.dart';
import '../model/product.dart';
import 'app_event.dart';
import 'state/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(
    AppState(
      bodySections: const [],
      products: const [],
      appScrollController: ScrollController(),
      productsCarouselController: CarouselController(),
      welcomeAnimationState: WelcomeAnimationInitial(),
      productsAnimationState: ProductsAnimationInitial(),
      scrollToTopFabState: ScrollToTopFabHidden(),
    )
  ) {
    on<Init>((event, emit) {
      emit(state.copyWith(bodySections: BodySection.getItems(event.context)));
      emit(state.copyWith(products: Product.getItems()));
      _initAnimations();
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
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepTwo()));
    });
    on<RemoveProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationInitial()));
    });
    on<AppBarLeadingTap>((event, emit) {
      _navigateToSection(0);
    });
    on<AppBarButtonTap>((event, emit) {
      _navigateToSection(event.index);
    });
    on<WelcomeButtonTap>((event, emit) {
      _navigateToSection(1);
    });
    on<ShowScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabVisible()));
    });
    on<HideScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabHidden()));
    });
    on<ScrollToTop>((event, emit) {
      _navigateToSection(0);
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

  void _initAnimations() {
    add(InitWelcomeAnimation());
    _initScrollAnimations();
  }

  void _initScrollAnimations() {
    final productsOffset = state.bodySections[1].offset;
    final productsAnimationTriggerOffset = productsOffset / 1.2;
    state.appScrollController.addListener(() {
      if(state.appScrollController.offset > 0
          && state.scrollToTopFabState is ScrollToTopFabHidden) {
        add(ShowScrollToTopFab());
      }
      if(state.appScrollController.offset == 0
          && state.scrollToTopFabState is ScrollToTopFabVisible) {
        add(HideScrollToTopFab());
      }
      if(state.appScrollController.offset > productsAnimationTriggerOffset
          && state.productsAnimationState is ProductsAnimationInitial
      ) {
        add(InitProductsAnimation());
      }
      if(state.appScrollController.offset < productsAnimationTriggerOffset
          && state.productsAnimationState is ProductsAnimationStepTwo
      ) {
        add(RemoveProductsAnimation());
      }
    });
  }

  void _navigateToSection(index) {
    final double currentOffset = state.appScrollController.offset;
    final double targetOffset = state.bodySections.firstWhere((element) => element.index == index).offset;
    state.appScrollController.animateTo(
      currentOffset < targetOffset
        ? targetOffset + LayoutDimensions.appBarHeight
        : targetOffset,
      duration: const Duration(seconds: 1),
      curve: Curves.ease
    );
  }
}
