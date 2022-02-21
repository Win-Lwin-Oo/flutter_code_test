import 'package:flutter/material.dart';
import 'package:ui_test/views/component/custom_paint/rectangle/custom_draw_rectangle.dart';

class CustomRectangle extends StatelessWidget {
  const CustomRectangle({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomDrawRectangle(),
      child: SizedBox(
        width: 130.0,
        height: 45.0,
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
