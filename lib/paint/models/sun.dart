import 'dart:ui';

import 'package:flutter/material.dart';

//модель для солнца
double getDropsOpacity({required double value}) {
  if (value < 0.3) {
    return 0;
  }

  return 5 / 3 * value - 1 / 2;
}

void paintSun({
  required Canvas canvas,
  required Size size,
  required double currentRangeValues,
}) {
  final painterSun = Paint()
    ..color =
        Colors.amber.withOpacity(1 - getDropsOpacity(value: currentRangeValues))
    ..style = PaintingStyle.fill;

  //рисуем солнце
  var sunOffsetCenter = Offset(size.width * 0.5, size.height * 0.4);

  canvas.drawCircle(sunOffsetCenter, size.width * 0.25, painterSun);
}
