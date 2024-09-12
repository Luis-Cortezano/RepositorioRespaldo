/*import 'package:flutter/material.dart';

class RegistroTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 220.0, // Aumento de la altura para hacer el diseño más grande
      ),
      painter: RegistroTopBarPainter(),
    );
  }
}

class RegistroTopBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Primer fondo
    path.lineTo(size.width * 0.25, size.height);
    path.lineTo(size.width * 0.75, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    paint.color = Colors.teal[300]!;
    canvas.drawPath(path, paint);

    // Segundo fondo
    path = Path();
    path.moveTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.50, size.height * 0.50);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    paint.color = Colors.teal[400]!;
    canvas.drawPath(path, paint);

    // Tercer fondo
    path = Path();
    path.moveTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height * 0.50);
    path.lineTo(size.width * 0.50, size.height);
    path.lineTo(0, 0);
    path.close();
    paint.color = Colors.teal[500]!;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}*/
 