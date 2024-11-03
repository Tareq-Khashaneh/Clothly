import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_clothing/core/constants/routes.dart';
import 'package:ecommerce_clothing/features/home/data/models/product_model.dart';
import 'package:ecommerce_clothing/features/home/logic/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';

class ProductCard extends StatelessWidget {
   ProductCard({super.key, required this.product});
  final ProductModel product;

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.detailsRoute,arguments: product),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.kSecondColorGrey2.withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius05))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/logo.jpg",
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.contain,
                        width: 200,
                        height: 320,
                      )),
                ),
                Flexible(
                  child: Text(
                    product.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: Dimensions.screenHeight * 0.022,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Text(
                    product.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.kSecondColorGrey),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price.toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: Dimensions.screenWidth * 0.05,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                      Flexible(
                          child: Text(
                        product.rate.rate,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                // setState(() {
                //   widget.product.isFavourite = !widget.product.isFavourite;
                // });
                controller.toggleFavorite(product: product);
              },
              child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kMainColorBlack),
                  child: Icon(
                    !product.isFavorite
                        ? Icons.favorite_border_rounded
                        : Icons.favorite_rounded,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
