import 'package:carousel_slider/carousel_controller.dart';
import 'package:demirli_tech_v2/domain/bloc/state/products_animation_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/scroll_to_top_fab_state.dart';
import 'package:demirli_tech_v2/domain/bloc/state/welcome_animation_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/body_section.dart';
import '../../model/product.dart';

class AppState extends Equatable{
  final List<BodySection> bodySections;
  final List<Product> products;
  final ScrollController appScrollController;
  final CarouselController productsCarouselController;
  final WelcomeAnimationState welcomeAnimationState;
  final ProductsAnimationState productsAnimationState;
  final ScrollToTopFabState scrollToTopFabState;

  const AppState(
    {
      required this.bodySections,
      required this.products,
      required this.appScrollController,
      required this.productsCarouselController,
      required this.welcomeAnimationState,
      required this.productsAnimationState,
      required this.scrollToTopFabState,
    }
  );

  AppState copyWith({
    List<BodySection>? bodySections,
    List<Product>? products,
    ScrollController? appScrollController,
    CarouselController? productsCarouselController,
    WelcomeAnimationState? welcomeAnimationState,
    ProductsAnimationState? productsAnimationState,
    ScrollToTopFabState? scrollToTopFabState,
  }) {
    return AppState(
      products: products ?? this.products,
      bodySections: bodySections ?? this.bodySections,
      appScrollController: appScrollController ?? this.appScrollController,
      productsCarouselController: productsCarouselController ?? this.productsCarouselController,
      welcomeAnimationState: welcomeAnimationState ?? this.welcomeAnimationState,
      productsAnimationState: productsAnimationState ?? this.productsAnimationState,
      scrollToTopFabState: scrollToTopFabState ?? this.scrollToTopFabState,
    );
  }

  @override
  List<Object?> get props => [bodySections, products, appScrollController, productsCarouselController, welcomeAnimationState, productsAnimationState, scrollToTopFabState];
}