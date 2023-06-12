import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable{
  final ScrollController appScrollController;
  final CarouselController productsCarouselController;
  final WelcomeAnimationState welcomeAnimationState;
  final ProductsAnimationState productsAnimationState;
  final ScrollToTopFabState scrollToTopFabState;

  const AppState(
    {
      required this.appScrollController,
      required this.productsCarouselController,
      required this.welcomeAnimationState,
      required this.productsAnimationState,
      required this.scrollToTopFabState,
    }
  );

  AppState copyWith({
    ScrollController? appScrollController,
    CarouselController? productsCarouselController,
    WelcomeAnimationState? welcomeAnimationState,
    ProductsAnimationState? productsAnimationState,
    ScrollToTopFabState? scrollToTopFabState,
  }) {
    return AppState(
      appScrollController: appScrollController ?? this.appScrollController,
      productsCarouselController: productsCarouselController ?? this.productsCarouselController,
      welcomeAnimationState: welcomeAnimationState ?? this.welcomeAnimationState,
      productsAnimationState: productsAnimationState ?? this.productsAnimationState,
      scrollToTopFabState: scrollToTopFabState ?? this.scrollToTopFabState,
    );
  }

  @override
  List<Object?> get props => [appScrollController, productsCarouselController, welcomeAnimationState, productsAnimationState, scrollToTopFabState];
}

abstract class WelcomeAnimationState {
  final int textAnimationDuration;
  final double textOpacity;
  final int buttonAnimationDuration;
  final double buttonOpacity;
  final int appBarAnimationDuration;
  final double appBarOpacity;
  final int bgAnimationDuration;
  final double bgOpacity;
  WelcomeAnimationState(
    {
      this.textAnimationDuration = 2000,
      required this.textOpacity,
      this.buttonAnimationDuration = 1000,
      required this.buttonOpacity,
      this.appBarAnimationDuration = 1000,
      required this.appBarOpacity,
      this.bgAnimationDuration = 1000,
      required this.bgOpacity,
    }
  );
}

class WelcomeAnimationInitial extends WelcomeAnimationState{
  WelcomeAnimationInitial({super.textOpacity = 0, super.buttonOpacity = 0, super.appBarOpacity = 0, super.bgOpacity = 1, });
}

class WelcomeAnimationStepOne extends WelcomeAnimationState{
  WelcomeAnimationStepOne({super.textOpacity = 1, super.buttonOpacity = 0, super.appBarOpacity = 0, super.bgOpacity = 1, });
}

class WelcomeAnimationStepTwo extends WelcomeAnimationState{
  WelcomeAnimationStepTwo({super.textOpacity = 1, super.buttonOpacity = 1, super.appBarOpacity = 0, super.bgOpacity = 1, });
}

class WelcomeAnimationStepThree extends WelcomeAnimationState{
  WelcomeAnimationStepThree({super.textOpacity = 1, super.buttonOpacity = 1, super.appBarOpacity = 1, super.bgOpacity = 0,});
}

abstract class ProductsAnimationState {
  final double titleLineWidth;
  final int sliderAnimationDuration;
  final double sliderOffsetY;
  final double sliderOpacity;
  final int productItemAnimationDuration;
  final double productItemOpacity;
  final int buttonsAnimationDuration;
  final double backButtonOffsetX;
  final double nextButtonOffsetX;
  ProductsAnimationState(
    {
      required this.titleLineWidth,
      this.sliderAnimationDuration = 1000,
      required this.sliderOffsetY,
      required this.sliderOpacity,
      this.productItemAnimationDuration = 800,
      required this.productItemOpacity,
      this.buttonsAnimationDuration = 600,
      required this.backButtonOffsetX,
      required this.nextButtonOffsetX,
    }
  );
}

class ProductsAnimationInitial extends ProductsAnimationState{
  ProductsAnimationInitial({super.titleLineWidth = 0, super.sliderOffsetY = 1, super.sliderOpacity = 0, super.productItemOpacity = 0, super.backButtonOffsetX = -1, super.nextButtonOffsetX = 1});
}

class ProductsAnimationStepOne extends  ProductsAnimationState{
  ProductsAnimationStepOne({super.titleLineWidth = 100, super.sliderOffsetY = 0, super.sliderOpacity = 1, super.productItemOpacity = 0, super.backButtonOffsetX = -0.5, super.nextButtonOffsetX = 0.5});
}

class ProductsAnimationStepTwo extends  ProductsAnimationState{
  ProductsAnimationStepTwo({super.titleLineWidth = 100, super.sliderOffsetY = 0, super.sliderOpacity = 1, super.productItemOpacity = 1, super.backButtonOffsetX = 0, super.nextButtonOffsetX = 0});
}

abstract class ScrollToTopFabState {
  final int animationDuration;
  final double offsetX;
  ScrollToTopFabState (
    {
      this.animationDuration = 250,
      required this.offsetX,
    }
  );
}
class ScrollToTopFabHidden extends ScrollToTopFabState{
  ScrollToTopFabHidden({super.offsetX = 2});
}
class ScrollToTopFabVisible extends ScrollToTopFabState{
  ScrollToTopFabVisible({super.offsetX = 0});
}
