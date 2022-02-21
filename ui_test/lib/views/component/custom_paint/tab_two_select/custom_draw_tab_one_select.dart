import 'package:flutter/material.dart';
import 'package:ui_test/constant/color_property.dart';

class CustomDrawTabTwoSelect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = TAB_SELECTED_COLOR;

    Path path = Path()
      ..moveTo(15, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - 15, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
