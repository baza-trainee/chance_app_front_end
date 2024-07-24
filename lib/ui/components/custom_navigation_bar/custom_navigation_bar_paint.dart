import 'package:chance_app/ui/constans.dart';
import 'package:flutter/material.dart';

class CustomNavigationBarPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = darkNeutral800
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.moveTo(size.width * 0.35, 0);
    path.arcToPoint(Offset(size.width * 0.65, 0), radius: const Radius.circular(20.0), clockwise: false);
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);


    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}