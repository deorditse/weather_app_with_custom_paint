import 'dart:ui';

import 'package:flutter/material.dart';

//модель для дождя
double getDropsOpacity({required double value}) {
  if (value < 0.7) {
    return 0;
  }

  return 10 / 3 * value - 7 / 3;
}

void paintRain({
  required Canvas canvas,
  required Size size,
  required double currentRangeValues,
}) {
  final painterRain = Paint()
    ..color =
        Colors.blue.withOpacity(getDropsOpacity(value: currentRangeValues))
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round; //закругление углов

  final path = Path()
    ..moveTo(size.width * 0.52, size.height * 0.72)
    ..lineTo(size.width * 0.48, size.height * 0.83)
    ..arcToPoint(
      Offset(size.width * 0.42, size.height * 0.8),
      radius: Radius.circular(size.width * 0.001),
      clockwise: true,
    ) //clockwise - в какую сторону изогнут
    ..close()
    ..moveTo(size.width * 0.32, size.height * 0.72)
    ..lineTo(size.width * 0.28, size.height * 0.83)
    ..arcToPoint(
      Offset(size.width * 0.22, size.height * 0.8),
      radius: Radius.circular(size.width * 0.001),
      clockwise: true,
    )
    ..close()
    ..moveTo(size.width * 0.72, size.height * 0.72)
    ..lineTo(size.width * 0.68, size.height * 0.83)
    ..arcToPoint(
      Offset(size.width * 0.62, size.height * 0.8),
      radius: Radius.circular(size.width * 0.001),
      clockwise: true,
    )
    ..close();

  canvas.drawPath(path, painterRain);
}
