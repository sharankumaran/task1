import 'package:flutter/material.dart';

class HEADER_DESIGN extends StatelessWidget {
  const HEADER_DESIGN({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Image.asset(
            'assets/images/WhatsApp Image 2025-09-04 at 2.20.00 PM.jpeg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 20),
        Positioned(
          top: -150,
          right: 220,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(300),
            ),
          ),
        ),
        Positioned(
          top: -50,
          right: -300,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(300),
            ),
          ),
        ),
      ],
    );
  }
}
