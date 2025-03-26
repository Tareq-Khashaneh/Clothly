import 'dart:math';

import 'package:clothly/features/cart/logic/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_floating_button.dart';
import '../../../../core/shared/custom_icon.dart';
import '../../../../core/shared/custom_title.dart';
import '../widgets/checkout_product_card.dart';
class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        onTap: (){},
        child: const CustomTitle(
          text: "Pay",
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenWidth * 0.4,
            vertical: Dimensions.screenHeight * 0.02),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.offAllNamed(AppRoutes.homeRoute) ,
                  child: CustomIcon(
                    image: "",
                    circleColor: Colors.white,
                    iconColor: AppColors.kMainColorBlack,
                  ),
                ),
                CustomTitle(text: "Cart"),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(0, 0, -1.0) // Scale X by -1 to flip horizontally
                    ..setEntry(3, 3, 1.0),
                  child: CustomIcon(
                    image: "assets/icons/menu.svg",
                    circleColor: Colors.white,
                    iconColor: AppColors.kMainColorBlack,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.02,
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.4,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.screenHeight * 0.02,
                  ),
                  shrinkWrap: true,
                  itemCount: controller.cartProducts.length,
                  itemBuilder: (context, index) {
                    return CartProductCard(
                        cartProduct: controller.cartProducts[index],);
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitle(
                    text: "Shipping Information",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 10, 0),
                          child: SvgPicture.asset(
                            "assets/icons/visa-svgrepo-com.svg",
                            width: 50,
                          ),
                        ),
                        labelText: "*********232",
                        fillColor: AppColors.kSecondColorGrey2,
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide.none)),
                    value: "*********232",
                    items: [],
                    onChanged: (Object? value) {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTitle(
                        text: "Total(9Items)",
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomTitle(
                        text: "price",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTitle(
                        text: "Shipping Fee",
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomTitle(
                        text: "\$0.0",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTitle(
                        text: "Sub Total",
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomTitle(
                        text: "price",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
