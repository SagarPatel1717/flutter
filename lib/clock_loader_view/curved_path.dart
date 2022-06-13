/// List<Path> listOfOuterCircleOffset() {}

// var initSectors = getSectionsCoordinatesInCircle(Offset(150, 150), quadraticCircleRadius, 24);
// List<Offset> evenOffsets = [];
// initSectors.mapIndexed((index, element) {
//   if (index % 2 != 0) {
//     evenOffsets.add(element);
//   }
// }).toList();

// ///
// var x0 = (radius) + (innerCircleRadius * cos(0 * pi / 180));
// var y0 = (radius) + (innerCircleRadius * sin(0 * pi / 180));
// Path path0 = Path();
// path0.moveTo(radius, radius);
// path0.quadraticBezierTo(evenOffsets[9].dx, evenOffsets[9].dy, x0, y0);
// listPath.add(path0);
// ///
//
// ///
// var x30 = (radius) + (innerCircleRadius * cos(30 * pi / 180));
// var y30 = (radius) + (innerCircleRadius * sin(30 * pi / 180));
// Path path30 = Path();
// path30.moveTo(radius, radius);
// path30.quadraticBezierTo(evenOffsets[10].dx, evenOffsets[10].dy, x30, y30);
// listPath.add(path30);
// ///
//
// ///
// var x60 = (radius) + (innerCircleRadius * cos(60 * pi / 180));
// var y60 = (radius) + (innerCircleRadius * sin(60 * pi / 180));
// Path path60 = Path();
// path60.moveTo(radius, radius);
// path60.quadraticBezierTo(evenOffsets[11].dx, evenOffsets[11].dy, x60, y60);
// listPath.add(path60);
// ///
//
// ///
// var x90 = (radius) + (innerCircleRadius * cos(90 * pi / 180));
// var y90 = (radius) + (innerCircleRadius * sin(90 * pi / 180));
// Path path90 = Path();
// path90.moveTo(radius, radius);
// path90.quadraticBezierTo(evenOffsets[0].dx, evenOffsets[0].dy, x90, y90);
// listPath.add(path90);
// ///
//
// ///
// var x120 = (radius) + (innerCircleRadius * cos(120 * pi / 180));
// var y120 = (radius) + (innerCircleRadius * sin(120 * pi / 180));
// Path path120 = Path();
// path120.moveTo(radius, radius);
// path120.quadraticBezierTo(evenOffsets[1].dx, evenOffsets[1].dy, x120, y120);
// listPath.add(path120);
// ///
//
// ///
// var x150 = (radius) + (innerCircleRadius * cos(150 * pi / 180));
// var y150 = (radius) + (innerCircleRadius * sin(150 * pi / 180));
// Path path150 = Path();
// path150.moveTo(radius, radius);
// path150.quadraticBezierTo(evenOffsets[2].dx, evenOffsets[2].dy, x150, y150);
// listPath.add(path150);
// ///
//
// ///
// var x180 = (radius) + (innerCircleRadius * cos(180 * pi / 180));
// var y180 = (radius) + (innerCircleRadius * sin(180 * pi / 180));
// Path path180 = Path();
// path180.moveTo(radius, radius);
// path180.quadraticBezierTo(evenOffsets[3].dx, evenOffsets[3].dy, x180, y180);
// listPath.add(path180);
// ///
//
// ///
// var x210 = (radius) + (innerCircleRadius * cos(210 * pi / 180));
// var y210 = (radius) + (innerCircleRadius * sin(210 * pi / 180));
// Path path210 = Path();
// path210.moveTo(radius, radius);
// path210.quadraticBezierTo(evenOffsets[4].dx, evenOffsets[4].dy, x210, y210);
// listPath.add(path210);
// ///
//
//
// ///
// var x240 = (radius) + (innerCircleRadius * cos(240 * pi / 180));
// var y240 = (radius) + (innerCircleRadius * sin(240 * pi / 180));
// Path path240 = Path();
// path240.moveTo(radius, radius);
// path240.quadraticBezierTo(evenOffsets[5].dx, evenOffsets[5].dy, x240, y240);
// listPath.add(path240);
// ///
//
// ///
// var x270 = (radius) + (innerCircleRadius * cos(270 * pi / 180));
// var y270 = (radius) + (innerCircleRadius * sin(270 * pi / 180));
// Path path270 = Path();
// path270.moveTo(radius, radius);
// path270.quadraticBezierTo(evenOffsets[6].dx, evenOffsets[6].dy, x270, y270);
// listPath.add(path270);
// ///
//
//
// ///
// var x300 = (radius) + (innerCircleRadius * cos(300 * pi / 180));
// var y300 = (radius) + (innerCircleRadius * sin(300 * pi / 180));
// Path path300 = Path();
// path300.moveTo(radius, radius);
// path300.quadraticBezierTo(evenOffsets[7].dx, evenOffsets[7].dy, x300, y300);
// listPath.add(path300);
// ///
//
// ///
// var x330 = (radius) + (innerCircleRadius * cos(330 * pi / 180));
// var y330 = (radius) + (innerCircleRadius * sin(330 * pi / 180));
// Path path330 = Path();
// path330.moveTo(radius, radius);
// path330.quadraticBezierTo(evenOffsets[8].dx, evenOffsets[8].dy, x330, y330);
// listPath.add(path330);
// ///



// for (int i = 0; i < evenOffsets.length; i++) {
//   Path path = Path();
//   path.moveTo(radius, radius);
//   path.lineTo(evenOffsets[i].dx, evenOffsets[i].dy);
//   listPath.add(path);
// }
//
// for (double i = 0; i < 360; i += 30) {
//   var x2 = radius + (innerCircleRadius * cos(i * pi / 180));
//   var y2 = radius + (innerCircleRadius * sin(i * pi / 180));
//   Path path = Path();
//   path.moveTo(radius, radius);
//   path.lineTo(x2, y2);
//   listPath.add(path);
// }