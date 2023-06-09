import 'package:flutter/material.dart';

class AppState {
  ScrollController controller;
  WelcomeAnimationAttr welcomeAnimationAttr;
  AppState(
      {
        required this.controller,
        required this.welcomeAnimationAttr
      }
  );
}

class WelcomeAnimationAttr {
  double textOpacity;
  double buttonOpacity;

  WelcomeAnimationAttr(
    {
      required this.textOpacity,
      required this.buttonOpacity
    }
  );
}