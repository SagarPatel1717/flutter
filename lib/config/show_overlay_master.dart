import 'package:flutter/material.dart';

class ShowOverlayMasterClass {
  BuildContext? overlayContext;
  GlobalKey materialButtonGlobalKey;
  int renderRoundEffectCount;
  ShowOverlayMasterClass(this.overlayContext, this.materialButtonGlobalKey,
      this.renderRoundEffectCount) {
    overlayState = Overlay.of(overlayContext!);

    final renderBox = _getWidgetInfo(widgetKey: materialButtonGlobalKey);
    widgetSize = renderBox.size;
    widgetCurrentOffset = renderBox.localToGlobal(Offset.zero);
    radius = 100.0;

    final left = (widgetCurrentOffset.dx + (widgetSize.width / 2));
    final top = (widgetCurrentOffset.dy + (widgetSize.height / 2));
    listOfOverlayEntries = List.generate(renderRoundEffectCount, (index) {
      final radiusForCalculation = index == 0 ? radius : (radius * (index * 2));
      return OverlayEntry(
        builder: (context) => Positioned(
          left: left - radiusForCalculation,
          top: top - radiusForCalculation,
          child: GestureDetector(
            onTap: () {
              listOfOverlayEntries.map((e) => e.remove());
            },
            child: CircleAvatar(
              radius: radiusForCalculation,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: const Text("1"),
            ),
          ),
        ),
      );
    });

    setUpOverlay();
  }

  late List<OverlayEntry> listOfOverlayEntries;

  OverlayState? overlayState;
  late double radius;
  late Size widgetSize;
  late Offset widgetCurrentOffset;
  // late OverlayEntry overlayEntry1;
  // late OverlayEntry overlayEntry2;
  // late OverlayEntry overlayEntry3;

  setUpOverlay() {
    overlayState?.insertAll(listOfOverlayEntries);
  }

  RenderBox _getWidgetInfo({required GlobalKey widgetKey}) {
    final RenderBox renderBox =
    widgetKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox;
  }
}

// setUpOverlay()  {
//   /* final left = (widgetCurrentOffset.dx + (widgetSize.width / 2));
//     final top = (widgetCurrentOffset.dy + (widgetSize.height / 2));
//     overlayEntry1 = OverlayEntry(
//       builder: (context) => Positioned(
//         left: left - radius,
//         top: top - radius,
//         child: CircleAvatar(
//           radius: radius,
//           backgroundColor: Colors.grey.withOpacity(0.2),
//           child: const Text("1"),
//         ),
//       ),
//     );
//
//     overlayEntry2 = OverlayEntry(
//       builder: (context) => Positioned(
//         left: left - (radius * 2),
//         top: top - (radius * 2),
//         child: CircleAvatar(
//           radius: radius * 2,
//           backgroundColor: Colors.grey.withOpacity(0.2),
//           child: const Text("1"),
//         ),
//       ),
//     );
//
//     overlayEntry3 = OverlayEntry(
//       builder: (context) => Positioned(
//         left: left - (radius * 4),
//         top: top - (radius * 4),
//         child: GestureDetector(
//           onTap: () {
//             overlayEntry1.remove();
//             overlayEntry2.remove();
//             overlayEntry3.remove();
//           },
//           child: CircleAvatar(
//             radius: radius * 4,
//             backgroundColor: Colors.grey.withOpacity(0.2),
//             child: const Text("1"),
//           ),
//         ),
//       ),
//     );
//
//      overlayState?.insertAll([overlayEntry1, overlayEntry2, overlayEntry3]);
//      */
// }
