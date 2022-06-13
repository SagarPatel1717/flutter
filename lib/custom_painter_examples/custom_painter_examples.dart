import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomPainterExample extends StatefulWidget {
  const CustomPainterExample({Key? key}) : super(key: key);

  @override
  _CustomPainterExampleState createState() => _CustomPainterExampleState();
}

class _CustomPainterExampleState extends State<CustomPainterExample> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      // foregroundPainter: DemoForegroundPainter(),
      painter: DemoPainter(),
    );
  }
}

class DemoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var strokeWidth = 10.0;

    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    final path = Path()
      ..moveTo(strokeWidth, strokeWidth)
      ..arcToPoint(Offset(size.width - strokeWidth, size.height - strokeWidth),
          radius: Radius.circular(math.max(size.width, size.height)));

    canvas.drawPath(path, paint);


    // var center = size/2;
    // var paint = Paint()..color = Colors.black..strokeWidth = 10.0;
    //
    // canvas.drawLine(Offset(0, center.height), Offset(size.width, center.height), paint);
    // canvas.drawRect(Rect.fromCenter(
    //   center: Offset(size.width - 150, size.height - 150),
    //   width: 30,
    //   height: 30,
    // ), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}