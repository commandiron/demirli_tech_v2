import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class NavigateSection extends AppEvent {
  final BuildContext context;
  final int index;

  const NavigateSection(this.context, this.index);

  @override
  List<Object?> get props => [context, index];
}

class StartWelcomeAnimation extends AppEvent {
  @override
  List<Object?> get props => [];
}