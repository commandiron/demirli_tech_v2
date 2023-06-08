import 'package:flutter/material.dart';

class AppState {
  ScrollController controller;
  bool isAppBarTransparent;
  AppState(
      {
        required this.controller,
        required this.isAppBarTransparent,
      }
  );
}