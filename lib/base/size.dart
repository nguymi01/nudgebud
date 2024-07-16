import 'package:flutter/material.dart';

class AppSize{
  static const double _baseWidth = 375;
  static const double _baseHeight = 640;

  static double getWidth(BuildContext context, double size){
    final double screenWidth = MediaQuery.of(context).size.width;
    return size * screenWidth / _baseWidth;
  }

  static double getHeight(BuildContext context, double size){
    final double screenHeight = MediaQuery.of(context).size.height;
    return size * screenHeight / _baseHeight;
  }

  static double getFontSize(BuildContext context, double fontSize){
    final double screenWidth = MediaQuery.of(context).size.width;
    return fontSize * screenWidth / _baseWidth;
  }
}