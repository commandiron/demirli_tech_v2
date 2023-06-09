import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class InitAppAnimations extends AppEvent {
  final BuildContext context;

  const InitAppAnimations(this.context,);

  @override
  List<Object?> get props => [context,];
}

class NavigateSection extends AppEvent {
  final BuildContext context;
  final int index;

  const NavigateSection(this.context, this.index);

  @override
  List<Object?> get props => [context, index];
}

class OnWelcomeButtonHover extends AppEvent {
  final bool value;

  const OnWelcomeButtonHover(this.value);

  @override
  List<Object?> get props => [value];
}

class StartWelcomeAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}

class StartProductsAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ProductsCarouselNext extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ProductsCarouselBack extends AppEvent {
  @override
  List<Object?> get props => [];
}