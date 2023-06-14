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
  final BuildContext context;
  const AppBarLeadingTap(this.context);
  @override
  List<Object?> get props => [context];
}

class AppBarButtonTap extends AppEvent {
  final BuildContext context;
  final int index;
  const AppBarButtonTap(this.context, this.index);
  @override
  List<Object?> get props => [context, index];
}

class WelcomeButtonTap extends AppEvent {
  final BuildContext context;
  const WelcomeButtonTap(this.context);
  @override
  List<Object?> get props => [context];
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
  final BuildContext context;
  const ScrollToTop(this.context);
  @override
  List<Object?> get props => [context];
}