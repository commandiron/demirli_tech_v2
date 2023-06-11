import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable{
  final ScrollController appScrollController;
  final CarouselController productsCarouselController;
  final WelcomeAnimationState welcomeAnimationState;
  final ProductsAnimationState productsAnimationState;

  const AppState(
    {
      required this.appScrollController,
      required this.productsCarouselController,
      required this.welcomeAnimationState,
      required this.productsAnimationState
    }
  );

  AppState copyWith({
    ScrollController? appScrollController,
    CarouselController? productsCarouselController,
    WelcomeAnimationState? welcomeAnimationState,
    ProductsAnimationState? productsAnimationState,
  }) {
    return AppState(
      appScrollController: appScrollController ?? this.appScrollController,
      productsCarouselController: productsCarouselController ?? this.productsCarouselController,
      welcomeAnimationState: welcomeAnimationState ?? this.welcomeAnimationState,
      productsAnimationState: productsAnimationState ?? this.productsAnimationState
    );
  }

  @override
  List<Object?> get props => [appScrollController, productsCarouselController, welcomeAnimationState, productsAnimationState];
}

abstract class WelcomeAnimationState {
  final int textAnimationDuration;
  final double textOpacity;
  final int buttonAnimationDuration;
  final double buttonOpacity;
  WelcomeAnimationState(
    {
      required this.textOpacity,
      this.textAnimationDuration = 2000,
      required this.buttonOpacity,
      this.buttonAnimationDuration = 1000,
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