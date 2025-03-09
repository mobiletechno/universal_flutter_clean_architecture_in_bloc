import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUI extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromLTWH(size.width/4, 0, size.width/2, size.width/2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
return false;
  }

}
class Customclip extends CustomClipper{
  @override
  getClip(Size size) {
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom left
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0); // Top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
