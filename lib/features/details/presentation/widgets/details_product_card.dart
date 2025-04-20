import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothly/core/constants/images.dart';
import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_icon.dart';
import '../../../home/data/models/product_model.dart';
import '../../logic/details_controller.dart';

class DetailsProductCard extends StatelessWidget {
  const DetailsProductCard(
      {super.key, required this.product, required this.controller});
  final ProductModel product;
  final DetailsController controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? defaultImage,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(defaultImage,fit: BoxFit.cover,),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back,
                    child: CustomIcon(
                      icon: const Icon(Icons.arrow_back,color: Colors.black,),
                      circleColor: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomIcon(
                      circleColor: Colors.white,

                      icon: Icon(   product.isWishlist ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: Colors.red,),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                product.title!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.01,
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: Dimensions.screenWidth * 0.08,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            // Text("${product.rate.rate} (${product.rate.count} reviews)",style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.01,
        ),
     if(product.description != null)   ExpandableText(
          product.description!,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 3,
          style: Theme.of(context).textTheme.bodyLarge,
          linkColor: AppColors.kMainColorBlack2,
          linkStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chose Size",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CustomIcon(
                        circleColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        icon: Text(
                          "S",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomIcon(
                          circleColor: Colors.white,
                          icon: Text(
                            "M",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomIcon(
                        circleColor: Colors.white,
                        icon: Text(
                          "L",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomIcon(
                        circleColor: Colors.white,
                        icon: Text(
                          "XL",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.decreaseNumberOfProduct();
                        controller.calculatePriceOfProduct();
                      },
                      child: CustomIcon(
                        circleColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.screenWidth * 0.03,
                    ),
                    GetBuilder<DetailsController>(builder: (controller) {
                      return Text(
                        controller.number.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      );
                    }),
                    SizedBox(
                      width: Dimensions.screenWidth * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        controller.increaseNumberOfProduct();
                        controller.calculatePriceOfProduct();
                      },
                      child: CustomIcon(
                          circleColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                          icon: const Icon(
                            Icons.add,
                          )),
                    ),
                  ],
                ),
              ],
            ),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Color",
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     ),
            //     SizedBox(
            //       height: Dimensions.screenHeight * 0.023,
            //     ),
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         ColorIcon(size: Dimensions.screenHeight * 0.028, color: Colors.green),
            //         ColorIcon(size: Dimensions.screenHeight * 0.028, color: Colors.green),
            //         ColorIcon(size: Dimensions.screenHeight * 0.028, color: Colors.green),
            //         ColorIcon(size: Dimensions.screenHeight * 0.028, color: Colors.green),
            //       ],
            //     ),
            //     SizedBox(
            //       height: Dimensions.screenHeight * 0.15,
            //     ),
            //   ],
            // )
          ],
        ),
      ],
    );
  }
}
