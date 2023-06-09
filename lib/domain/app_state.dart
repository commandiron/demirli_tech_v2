import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable{
  final ScrollController controller;
  final WelcomeAnimationState welcomeAnimationState;

  const AppState(
    {
      required this.controller,
      required this.welcomeAnimationState
    }
  );

  @override
  List<Object?> get props => [controller, welcomeAnimationState];
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