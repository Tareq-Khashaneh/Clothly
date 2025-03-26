
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_floating_button.dart';
import '../../logic/details_controller.dart';
import '../widgets/details_product_card.dart';
class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomFloatingButton(
                  width: double.infinity,
                  onTap: (){
                    controller.addToCart();
                    Get.offNamed(AppRoutes.homeRoute);

                  },
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  SvgPicture.asset(
                    "assets/icons/shopping-cart.svg",
                    width: 40,
                  ),
                  Flexible(
                    child: GetBuilder<DetailsController>(
                      builder: (controller) {
                        return RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold, color: Colors.white,
                              fontSize: Dimensions.screenHeight * 0.022
                            ),
                            children: <TextSpan>[
                               TextSpan(
                                text: 'Add to Cart | \$${controller.finalPrice}',
                               ),
                              // TextSpan(
                              //     text: '\$190.99',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              //   color:  Colors.white,
                              //   decoration: TextDecoration.lineThrough,
                              //   decorationThickness: 2.5
                              // )),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                ],
              )),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              child: DetailsProductCard(wishlistItem: controller.wishlistItem!,controller: controller,),
            )));
  }
}
