import 'package:ecommerce_clothing/core/constants/routes.dart';
import 'package:ecommerce_clothing/features/bottom_navigation/logic/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_floating_button.dart';
import '../../../../core/shared/custom_icon.dart';

class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget({super.key, required this.pageIndex});
  BottomNavBarController controller = Get.find();
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: Dimensions.screenHeight * 0.12,
      child: CustomFloatingButton(
        // onTap: () {},
        margin: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.02),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  if (pageIndex != 0) {
                    Get.offNamed(AppRoutes.homeRoute);
                  }
                },
                child: Opacity(
                    opacity: pageIndex == 0 ? 1 : 0.5,
                    child: CustomIcon(image: "assets/icons/home-2.svg"))),
            InkWell(
                onTap: () {
                  if (pageIndex != 1) {
                    Get.toNamed(AppRoutes.checkoutRoute);
                  }
                },
                child: Opacity(
                    opacity: pageIndex == 1 ? 1 : 0.5,
                    child:
                        CustomIcon(image: "assets/icons/Group 3244.svg"))),
            InkWell(
                onTap: () {
                  if (pageIndex != 2) {
                    Get.offNamed(AppRoutes.wishlistRoute);
                  }
                },
                child: Opacity(
                    opacity: pageIndex == 2 ? 1 : 0.5,
                    child: CustomIcon(image: "assets/icons/heart.svg"))),
            InkWell(
                onTap: () {
                  if (pageIndex != 3) {
                    Get.toNamed(AppRoutes.profileRoute);
                  }
                },
                child: Opacity(
                    opacity: pageIndex == 3 ? 1 : 0.5,
                    child: CustomIcon(image: "assets/icons/profile.svg"))),
          ],
        ),
      ),
    );
  }
}
