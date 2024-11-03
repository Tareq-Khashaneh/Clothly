import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({super.key, required this.child,this.padding , this.margin,this.width,this.onTap});
  final Widget child;
  EdgeInsets? padding;
  EdgeInsets? margin;
  double? width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          margin: margin,
        decoration: BoxDecoration(
            color: AppColors.kMainColorBlack2,
            borderRadius: const BorderRadius.all(Radius.circular(40))
        ),
        child:child
      ),
    );
  }
}
