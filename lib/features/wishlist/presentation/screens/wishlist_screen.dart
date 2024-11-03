import 'package:ecommerce_clothing/features/bottom_navigation/presentation/screens/custom_scaffold.dart';
import 'package:ecommerce_clothing/features/wishlist/logic/wishlist_controller.dart';
import 'package:ecommerce_clothing/features/wishlist/presentation/widgets/wishlist_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_icon.dart';
import '../../../../core/shared/custom_title.dart';

class WishListScreen extends GetView<WishlistController> {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _buildBody(context: context),
      pageIndex: 2,
      isHaveBottomNav: true,
    );
  }

  Widget _buildBody({required BuildContext context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.offAllNamed(AppRoutes.homeRoute),
                  child: CustomIcon(
                    image: "assets/icons/arrow-down.svg",
                    width: Dimensions.screenWidth * 0.07,
                    circleColor: Colors.white,
                    iconColor: AppColors.kMainColorBlack,
                  ),
                ),
                SizedBox(
                  width: Dimensions.screenWidth * 0.2,
                ),
                CustomTitle(
                  text: "Wishlist",
                  fontWeight: FontWeight.w700,
                  color: AppColors.kSecondColorGrey,
                ),
              ],
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
          Expanded(
            child: GetBuilder<WishlistController>(builder: (controller){
              switch(controller.wishlist.length){
            
                case > 0:
                  return   ListView.separated(
                      separatorBuilder: (context, index) => Column(
                        children: [
                          SizedBox(
                            height: Dimensions.screenHeight * 0.02,
                          ),
                          const Divider(),
                        ],
                      ),
                      shrinkWrap: true,
                      itemCount: controller.wishlist.length,
                      itemBuilder: (context, index) {
                        final product = controller.wishlist[index];
                        return WishlistProductCard(
                          product: product, controller: controller,
                        );
                      });
                default:
                  return  Center(child: CustomTitle(text: "No items have been added yet",fontSize: Dimensions.screenHeight * 0.02,fontWeight: FontWeight.w600,),);
              }
            
            }),
          )
          ],
        ),
      );
}
