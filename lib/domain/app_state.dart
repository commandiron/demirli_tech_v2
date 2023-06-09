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

  @override
  List<Object?> get props => [appScrollController, productsCarouselController, welcomeAnimationState, productsAnimationState];
}

abstract class WelcomeAnimationState {
  final double textOpacity;
  final double buttonOpacity;
  WelcomeAnimationState(
    {
      required this.textOpacity,
      required this.buttonOpacity
    }
  );
}

class WelcomeAnimationInitial extends WelcomeAnimationState{
  WelcomeAnimationInitial({super.textOpacity = 0, super.buttonOpacity = 0});
}

class WelcomeAnimationStepOne extends WelcomeAnimationState{
  WelcomeAnimationStepOne({super.textOpacity = 1, super.buttonOpacity = 0});
}

class WelcomeAnimationStepTwo extends WelcomeAnimationState{
  WelcomeAnimationStepTwo({super.textOpacity = 1, super.buttonOpacity = 1});
}

abstract class ProductsAnimationState {
  final double offsetX;
  ProductsAnimationState(
    {
      required this.offsetX,
    }
  );
}

class ProductsAnimationInitial extends ProductsAnimationState{
  ProductsAnimationInitial({super.offsetX = 1,});
}

class ProductsAnimationStepOne extends  ProductsAnimationState{
  ProductsAnimationStepOne({super.offsetX = 0,});
}