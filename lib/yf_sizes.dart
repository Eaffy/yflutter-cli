import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double get SCREEN_WIDTH {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
  Size size = view.physicalSize / view.devicePixelRatio;
  double width = size.width;
  return width;
}

// ignore: non_constant_identifier_names
double get SCREEN_HEIGHT {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
  Size size = view.physicalSize / view.devicePixelRatio;
  double height = size.height;
  return height;
}
/// With BuildContext:
// // Dimensions in logical pixels (dp)
// Size size = MediaQuery.of(context).size;
// double width = size.width;
// double height = size.height;

// // Height (without SafeArea)
// final padding = MediaQuery.of(context).viewPadding;
// double height1 = height - padding.top - padding.bottom;

// // Height (without status bar)
// double height2 = height - padding.top;

// // Height (without status and toolbar)
// double height3 = height - padding.top - kToolbarHeight;

// // To get above dimensions in physical pixels (px), 
// // multiply them by `MediaQuery.of(context).devicePixelRatio`