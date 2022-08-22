import 'dart:ui';

import 'package:flutter/material.dart';

//модель для облака
double getDropsOpacity({required double value}) {
  if (value >= 0.2 && value <= 0.7) {
    return 2 * value - 2 / 5;
  }
  return 5 / 4 * value - 1 / 4;
}

void paintCloud({
  required Canvas canvas,
  required Size size,
  Color? color,
  required double currentRangeValues,
}) {
  final painterCloud = Paint()
    ..color = color?.withOpacity(getDropsOpacity(value: currentRangeValues)) ??
        Colors.grey.withOpacity(getDropsOpacity(value: currentRangeValues))
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round; //закругление углов

  final path = Path()
    ..moveTo(size.width * 0.5, size.height * 0.4)
    ..arcToPoint(Offset(size.width * 0.7, size.height * 0.5),
        radius: Radius.circular(size.width * 0.18),
        clockwise: true) //clockwise - в какую сторону изогнут
    ..arcToPoint(Offset(size.width * 0.8, size.height * 0.7),
        radius: Radius.circular(size.width * 0.1))
    ..arcToPoint(Offset(size.width * 0.2, size.height * 0.7),
        radius: Radius.circular(500))
    ..arcToPoint(Offset(size.width * 0.23, size.height * 0.5),
        radius: Radius.circular(size.width * 0.1))
    ..arcToPoint(Offset(size.width * 0.37, size.height * 0.48),
        radius: Radius.circular(size.width * 0.22), clockwise: false)
    ..arcToPoint(Offset(size.width * 0.5, size.height * 0.4),
        radius: Radius.circular(size.width * 0.18));
  //..close();

  canvas.drawPath(path, painterCloud);

  // final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
  //
  // canvas.drawRect(rect, painterCloud);
}
