// Extension to retrieve screen width and height from BuildContext
 // Accessing screen width and height using the extension
//   double screenWidth = context.screenWidth;
//    double screenHeight = context.screenHeight;
import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height; 
}

