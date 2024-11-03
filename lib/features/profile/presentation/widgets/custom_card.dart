import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';


class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.child,
        this.height,
        this.width,
      this.padding});
  final Widget child;
  double? height;
  double? width;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius05))),
      child: Container(
          width: width ?? double.infinity,
          height: height ?? Dimensions.screenHeight * 0.3,
          padding:
              padding ?? EdgeInsets.only(top: Dimensions.screenHeight * 0.075),
          decoration: BoxDecoration(
              color: AppColors.kSecondColorGrey2,
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius05))),
          child: child),
    );
  }
}
