import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable{
  final ScrollController appScrollController;
  final CarouselController productsCarouselController;
  final WelcomeAnimationState welcomeAnimationState;
  final IconData welcomeButtonIcon;
  final ProductsAnimationState productsAnimationState;

  const AppState(
    {
      required this.appScrollController,
      required this.productsCarouselController,
      required this.welcomeAnimationState,
      required this.welcomeButtonIcon,
      required this.productsAnimationState
    }
  );

  AppState copyWith({
    ScrollController? appScrollController,
    CarouselController? productsCarouselController,
    WelcomeAnimationState? welcomeAnimationState,
    IconData? welcomeButtonIcon,
    ProductsAnimationState? productsAnimationState,
  }) {
    return AppState(
      appScrollController: appScrollController ?? this.appScrollController,
      productsCarouselController: productsCarouselController ?? this.productsCarouselController,
      welcomeAnimationState: welcomeAnimationState ?? this.welcomeAnimationState,
      welcomeButtonIcon: welcomeButtonIcon ?? this.welcomeButtonIcon,
      productsAnimationState: productsAnimationState ?? this.productsAnimationState
    );
  }

  @override
  List<Object?> get props => [appScrollController, productsCarouselController, welcomeAnimationState, welcomeButtonIcon, productsAnimationState];
}

abstract class WelcomeAnimationState {
  final int animationDelayInSecond;
  final int textAnimationDurationInSecond;
  final double textOpacity;
  final int stepOneToTwoAnimationDelayInSecond;
  final int buttonAnimationDurationInSecond;
  final double buttonOpacity;
  WelcomeAnimationState(
    {
      this.animationDelayInSecond = 1,
      required this.textOpacity,
      this.textAnimationDurationInSecond = 2,
      this.stepOneToTwoAnimationDelayInSecond = 1,
      required this.buttonOpacity,
      this.buttonAnimationDurationInSecond = 1,
    }
  );
}

class WelcomeAnimationInitial extends WelcomeAnimationState{
  WelcomeAnimationInitial({super.textOpacity = 0, super.buttonOpacity = 0,});
}

class WelcomeAnimationStepOne extends WelcomeAnimationState{
  WelcomeAnimationStepOne({super.textOpacity = 1, super.buttonOpacity = 0,});
}

class WelcomeAnimationStepTwo extends WelcomeAnimationState{
  WelcomeAnimationStepTwo({super.textOpacity = 1, super.buttonOpacity = 1,});
}

abstract class ProductsAnimationState {
  final int sliderOffsetAnimationDurationInSecond;
  final double sliderOffsetX;
  final int productItemOpacityAnimationDurationInSecond;
  final double productItemOpacity;
  final int buttonsOffsetAnimationDurationInSecond;
  final double backButtonOffsetX;
  final double nextButtonOffsetX;
  final int stepOneToTwoAnimationDelayInSecond;
  ProductsAnimationState(
    {
      this.sliderOffsetAnimationDurationInSecond = 1,
      required this.sliderOffsetX,
      this.productItemOpacityAnimationDurationInSecond = 1,
      required this.productItemOpacity,
      this.buttonsOffsetAnimationDurationInSecond = 1,
      required this.backButtonOffsetX,
      required this.nextButtonOffsetX,
      this.stepOneToTwoAnimationDelayInSecond = 1,
    }
  );
}

class ProductsAnimationInitial extends ProductsAnimationState{
  ProductsAnimationInitial({super.sliderOffsetX = 1, super.productItemOpacity = 0, super.backButtonOffsetX = -1, super.nextButtonOffsetX = 1});
}

class ProductsAnimationStepOne extends  ProductsAnimationState{
  ProductsAnimationStepOne({super.sliderOffsetX = 0, super.productItemOpacity = 0, super.backButtonOffsetX = -1, super.nextButtonOffsetX = 1});
}

class ProductsAnimationStepTwo extends  ProductsAnimationState{
  ProductsAnimationStepTwo({super.sliderOffsetX = 0, super.productItemOpacity = 1, super.backButtonOffsetX = 0, super.nextButtonOffsetX = 0});
}