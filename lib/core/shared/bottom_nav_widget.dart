import 'package:clothly/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/dimensions.dart';
import 'custom_floating_button.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.pageIndex});

  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: Dimensions.screenHeight * 0.12,
      child: CustomFloatingButton(
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
                child: const Icon(Icons.home_rounded)),
            InkWell(
                onTap: () {
                  if (pageIndex != 1) {
                    Get.offNamed(AppRoutes.cartRoute);
                  }
                },
                child: const Icon(Icons.shopping_cart)), // InkWell(
            InkWell(
                onTap: () {
                  if (pageIndex != 2) {
                    Get.offNamed(AppRoutes.wishlistRoute);
                  }
                },
                child: const Icon(Icons.favorite)),
            InkWell(
                onTap: () {
                  if (pageIndex != 3) {
                    Get.offNamed(AppRoutes.profileRoute);
                  }
                },
                child: const Icon(Icons.person_rounded)),
          ],
        ),
      ),
    );
  }
}
