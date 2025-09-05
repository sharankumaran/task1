import 'package:flutter/material.dart';

class CurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstcurve = Offset(0, size.height - 20);
    final lastcurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
      firstcurve.dx,
      firstcurve.dy,
      lastcurve.dx,
      lastcurve.dy,
    );
    final second1stcurve = Offset(0, size.height - 20);
    final second2ndcurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      second1stcurve.dx,
      second1stcurve.dy,
      second2ndcurve.dx,
      second2ndcurve.dy,
    );

    final third1stcurve = Offset(size.width, size.height - 20);
    final thirdlastcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
      third1stcurve.dx,
      third1stcurve.dy,
      thirdlastcurve.dx,
      thirdlastcurve.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
