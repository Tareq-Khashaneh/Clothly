import'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text, this.fontSize, this.color, this.fontWeight = FontWeight.bold,this.maxLines = 1});
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColors.kMainColorBlack),
    );
  }
}
