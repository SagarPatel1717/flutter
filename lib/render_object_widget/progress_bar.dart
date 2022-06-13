import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProgressBar extends LeafRenderObjectWidget {
  ProgressBar({
    Key? key,
    required this.barColor,
    required this.thumbColor,
    this.thumbSize = 20.0,
  }) : super(key: key);

  final Color barColor;
  final Color thumbColor;
  final double thumbSize;

  @override
  RenderProgressBar createRenderObject(BuildContext context) {
    return RenderProgressBar(
      barColor: barColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
    );
  }

// @override
// void updateRenderObject(
//     BuildContext context, RenderProgressBar renderObject) {
//   renderObject
//     ..barColor = barColor
//     ..thumbColor = thumbColor
//     ..thumbSize = thumbSize;
// }

// @override
// void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   super.debugFillProperties(properties);
//   properties.add(ColorProperty('barColor', barColor));
//   properties.add(ColorProperty('thumbColor', thumbColor));
//   properties.add(DoubleProperty('thumbSize', thumbSize));
// }

}

class RenderProgressBar extends RenderBox {
  @override
  void performLayout() {
    // print('constraints1: $constraints');
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = thumbSize;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  double _currentThumbXPosition = 0.0;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    // canvas.save();
    canvas.translate(offset.dx, offset.dy);
    // print('offset.dx: ${offset.dx}, offset.dy: ${offset.dy}');

    final barPaint = Paint()
      ..color = barColor
      ..strokeWidth = 5;
    final point1 = Offset(0, size.height / 2);
    final point2 = Offset(size.width, size.height / 2);
    canvas.drawLine(point1, point2, barPaint);
    // paint thumb
    final thumbPaint = Paint()..color = thumbColor;
    final thumbDx = _currentThumbXPosition;
    final center = Offset(thumbDx, size.height / 2);
    canvas.drawCircle(center, thumbSize / 2, thumbPaint);
    // print('center: $center, thumbSize / 2: ${thumbSize / 2}');
    canvas.restore();
  }

  @override
  bool get isRepaintBoundary => true;

  late HorizontalDragGestureRecognizer _drag;
  @override
  bool hitTestSelf(Offset position) => true;
  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      print('event: $event');
      _drag.addPointer(event);
    }
  }

  static const _minDesiredWidth = 100.0;
  // @override
  // double computeMinIntrinsicWidth(double height) => _minDesiredWidth;
  // @override
  // double computeMaxIntrinsicWidth(double height) => _minDesiredWidth;
  // @override
  // double computeMinIntrinsicHeight(double width) => thumbSize;
  // @override
  // double computeMaxIntrinsicHeight(double width) => thumbSize;

  RenderProgressBar({
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
  })  : _barColor = barColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize {
    // initialize the gesture recognizer
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updateThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateThumbPosition(details.localPosition);
      };
  }

  Color get barColor => _barColor;
  Color _barColor;
  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbColor;
  Color _thumbColor;
  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  double get thumbSize => _thumbSize;
  double _thumbSize;
  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }
}

extension _ on RenderProgressBar {
  void _updateThumbPosition(Offset localPosition) {
    var dx = localPosition.dx.clamp(0, size.width);
    // print('dx: $dx, size.width: ${size.width}');
    _currentThumbXPosition = dx.toDouble();
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }
}