import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Adaptive extends StatelessWidget {
  final Widget mobileDevice;
  final Widget desktopDevice;
  const Adaptive({
    Key? key,
    required this.mobileDevice,
    required this.desktopDevice,
  }) : super(key: key);

  static bool isMac() => defaultTargetPlatform == TargetPlatform.macOS;

  static bool isAppleDevice() =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;

  static bool isMobileDevice() =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  static dynamic getValue(
    mobileDeviceValue,
    desktopDeviceValue,
  ) {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      return mobileDeviceValue;
    }
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return desktopDeviceValue;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android) {
          return mobileDevice;
        } else {
          return desktopDevice;
        }
      },
    );
  }
}
