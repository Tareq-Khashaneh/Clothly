import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon(
      {super.key,
      this.image,
      this.circleColor,
      this.iconColor,
      this.icon,
      this.padding,
        this.heightIcon,
        this.widthIcon,
      this.width = 40.0});
  String? image;
  Color? circleColor;
  Color? iconColor;
  Widget? icon;
  double width;
  double? heightIcon;
  double? widthIcon;
  EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightIcon,
        width: widthIcon,
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: circleColor != null
              ? Border.all(color: AppColors.kSecondColorGrey2)
              : null,
          color: circleColor ?? AppColors.kMainColorBlack),
      child: image == null
          ? icon
          : SvgPicture.asset(
              image!,
              width: width,
              color: iconColor ?? Colors.white,
            ),
    );
  }
}
