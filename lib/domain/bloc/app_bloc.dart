import 'package:carousel_slider/carousel_controller.dart';
import 'package:demirli_tech_v2/domain/bloc/state/products_animation_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/scroll_to_top_fab_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/welcome_animation_state.dart';
import 'package:demirli_tech_v2/home/sections/about/about_section.dart';
import 'package:demirli_tech_v2/home/sections/contact_us/contact_us_section.dart';
import 'package:demirli_tech_v2/home/sections/our_vision/our_vision_section.dart';
import 'package:demirli_tech_v2/home/sections/products/products_section.dart';
import 'package:demirli_tech_v2/home/sections/welcome/welcome_section.dart';
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
      emit(state.copyWith(bodySections: BodySection.items, products: Product.items));
      _initAnimations(event.context);
    });
    on<ForwardWelcomeAnimation>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepOne()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepTwo()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(welcomeAnimationState: WelcomeAnimationStepThree()));
    });
    on<ForwardProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepOne()));
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(productsAnimationState: ProductsAnimationStepTwo()));
    });
    on<BackwardProductsAnimation>((event, emit) async {
      emit(state.copyWith(productsAnimationState: ProductsAnimationInitial()));
    });
    on<AppBarLeadingTap>((event, emit) {
      _navigateToSection(event.context, WelcomeSection.index);
    });
    on<AppBarButtonTap>((event, emit) {
      _navigateToSection(event.context, event.index);
    });
    on<WelcomeButtonTap>((event, emit) {
      _navigateToSection(event.context, ProductsSection.index);
    });
    on<ShowScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabVisible()));
    });
    on<HideScrollToTopFab>((event, emit) {
      emit(state.copyWith(scrollToTopFabState: ScrollToTopFabHidden()));
    });
    on<ScrollToTop>((event, emit) {
      _navigateToSection(event.context, 0,);
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

  void _initAnimations(BuildContext context) {
    _initWelcomeAnimation();
    _initScrollAnimations(context);
  }

  void _initWelcomeAnimation() {
    add(ForwardWelcomeAnimation());
  }

  void _initScrollAnimations(BuildContext context) {
    state.appScrollController.addListener(() {
      if(state.appScrollController.offset > 0
          && state.scrollToTopFabState is ScrollToTopFabHidden) {
        add(ShowScrollToTopFab());
      }
      if(state.appScrollController.offset == 0
          && state.scrollToTopFabState is ScrollToTopFabVisible) {
        add(HideScrollToTopFab());
      }
      final productsOffset = ProductsSection.calculateHeight(context);
      final productsAnimationTriggerOffset = productsOffset / 1.2;
      if(state.appScrollController.offset > productsAnimationTriggerOffset
          && state.productsAnimationState is ProductsAnimationInitial
      ) {
        add(ForwardProductsAnimation());
      }
      if(state.appScrollController.offset < productsAnimationTriggerOffset
          && state.productsAnimationState is ProductsAnimationStepTwo
      ) {
        add(BackwardProductsAnimation());
      }
    });
  }

  void _navigateToSection(BuildContext context, index) {
    final double currentOffset = state.appScrollController.offset;
    double targetOffset = 0;
    if(index == 0) {
      targetOffset = WelcomeSection.offset;
    }
    if(index == 1) {
      targetOffset = ProductsSection.calculateOffset(context);
    }
    if(index == 2) {
      targetOffset = AboutSection.calculateOffset(context);
    }
    if(index == 3) {
      targetOffset = OurVisionSection.calculateOffset(context);
    }
    if(index == 4) {
      targetOffset = ContactUsSection.calculateOffset(context);
    }
    state.appScrollController.animateTo(
      currentOffset < targetOffset
        ? targetOffset + LayoutDimensions.appBarHeight
        : targetOffset,
      duration: const Duration(seconds: 1),
      curve: Curves.ease
    );
  }
}
