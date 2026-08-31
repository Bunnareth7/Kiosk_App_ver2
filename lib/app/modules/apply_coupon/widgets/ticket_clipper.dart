import 'package:flutter/material.dart';
class TicketClipper extends CustomClipper<Path> {
  const TicketClipper({this.notchRadius = 8});

  final double notchRadius;

  @override
  Path getClip(Size size) {
    final path = Path();
    final midY = size.height / 2;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, midY - notchRadius);
    path.arcToPoint(
      Offset(size.width, midY + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, midY + notchRadius);
    path.arcToPoint(
      Offset(0, midY - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant TicketClipper oldClipper) =>
      oldClipper.notchRadius != notchRadius;
}