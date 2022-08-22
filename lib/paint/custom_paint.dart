import 'package:flutter/material.dart';

import 'models/cloud.dart';
import 'models/rain.dart';
import 'models/sun.dart';

class MyCustomPainter extends CustomPainter {
  double currentRangeValues;

  MyCustomPainter({required this.currentRangeValues});

  @override
  void paint(Canvas canvas, Size size) {
    //Солнце
    if (currentRangeValues < 0.71) {
      paintSun(
        canvas: canvas,
        size: size,
        currentRangeValues: currentRangeValues,
      );
    }

    //Облако
    if (currentRangeValues > 0.2) {
      paintCloud(
        canvas: canvas,
        size: size,
        currentRangeValues: currentRangeValues,
      );
    }

    //Облако с дождем
    if (currentRangeValues > 0.7 && currentRangeValues <= 1) {
      paintCloud(
        canvas: canvas,
        size: size,
        color: Colors.black54.withOpacity(currentRangeValues),
        currentRangeValues: currentRangeValues,
      );
      paintRain(
        canvas: canvas,
        size: size,
        currentRangeValues: currentRangeValues,
      );
    }
  }

  ///
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate.toString() == currentRangeValues.toString() ? false : true;
}
