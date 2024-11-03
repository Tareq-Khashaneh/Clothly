import 'package:flutter/material.dart';

class ColorIcon extends StatelessWidget {
  const ColorIcon({super.key, required this.size, required this.color});
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: color,
      size: size,
    );
  }
}
