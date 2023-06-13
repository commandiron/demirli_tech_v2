import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class Init extends AppEvent {
  final BuildContext context;

  const Init(this.context);

  @override
  List<Object?> get props => [context];
}

class ForwardWelcomeAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ForwardProductsAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}

class BackwardProductsAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}

class AppBarLeadingTap extends AppEvent {
  const AppBarLeadingTap();
  @override
  List<Object?> get props => [];
}

class AppBarButtonTap extends AppEvent {
  final int index;
  const AppBarButtonTap(this.index);
  @override
  List<Object?> get props => [index];
}

class WelcomeButtonTap extends AppEvent {
  const WelcomeButtonTap();
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

class ShowScrollToTopFab extends AppEvent {
  @override
  List<Object?> get props => [];
}
class HideScrollToTopFab extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ScrollToTop extends AppEvent {
  const ScrollToTop();
  @override
  List<Object?> get props => [];
}