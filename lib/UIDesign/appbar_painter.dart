// ignore_for_file: file_names

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = AppTheme.black
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .08, 0.0)
      ..cubicTo(
          size.width * 0.04,
          0.0, //x1,y1
          0.0,
          0.04, //x2,y2
          0.0,
          0.1 * size.width //x3,y3
          );

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .92, 0.0)
      ..cubicTo(
          size.width * .96,
          0.0, //x1,y1
          size.width,
          0.96, //x2,y2
          size.width,
          0.1 * size.width //x3,y3
          );

    Paint paint_2 = Paint()
      ..color = AppTheme.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';

// class MyCustomPainter extends CustomPainter {
//   const MyCustomPainter({Listenable? repaint}) : super(repaint: repaint);

//   static const circleSize = 90.0;
//   static const gap = 15.0;

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..style = PaintingStyle.fill
//       ..color = const Color.fromRGBO(91, 189, 146, 1);

//     var shadow = Paint()
//       ..style = PaintingStyle.fill
//       ..color = const Color.fromARGB(255, 127, 127, 127)
//       ..maskFilter = MaskFilter.blur(
//         BlurStyle.normal,
//         Shadow.convertRadiusToSigma(5),
//       );

//     var path = Path();
//     path.lineTo(0, size.height - gap);
//     path.lineTo(size.width / 2, size.height - gap);
//     // path.arcTo(
//     //   Rect.fromLTWH(
//     //     size.width / 2 - circleSize / 2,
//     //     size.height - circleSize,
//     //     circleSize,
//     //     circleSize,
//     //   ),
//     //   pi,
//     //   -pi,
//     //   false,
//     // );
//     path.lineTo(size.width / 2, size.height - gap);
//     path.lineTo(size.width, size.height - gap);
//     path.lineTo(size.width, 0);
//     path.close();

//     canvas.drawPath(path, shadow);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(MyCustomPainter oldDelegate) {
//     return false;
//   }
// }
