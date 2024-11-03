import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_title.dart';
import '../../../home/data/models/product_model.dart';
import '../../logic/wishlist_controller.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({
    super.key,
    required this.product,
    required this.controller,
  });
  final ProductModel product;
  final WishlistController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB( 18,10, 28,10),
      decoration: BoxDecoration(
          color: AppColors.kSecondColorGrey2,
          borderRadius:
          BorderRadius.all(Radius.circular(Dimensions.radius05))),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.screenHeight * 0.02)),
            child: CachedNetworkImage(
              imageUrl: product.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,
              ),

              fit: BoxFit.cover, width: 80, // Set width here
              height: 90,
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                  text: product.title,
                  maxLines: 2,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomTitle(
                  text: product.category,
                  fontSize: 16,
                  color: AppColors.kSecondColorGrey,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTitle(
                  text: "\$${product.price}",
                  fontSize: 20,
                )
                // Text("")
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.screenWidth * 0.25,
          ),
          Expanded(
              child: InkWell(
                onTap: () => controller.removeFromWishList(product: product),
                child: Icon(
                            Icons.favorite,
                            size: Dimensions.screenHeight * 0.035,

                          ),
              ))
        ],
      ),
    );
  }
}
