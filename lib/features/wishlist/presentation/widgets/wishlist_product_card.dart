import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothly/core/constants/images.dart';
import 'package:clothly/features/wishlist/data/models/wishlist_model.dart';

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_title.dart';
import '../../../home/data/models/product_model.dart';
import '../../logic/wishlist_controller.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({
    super.key,
    required this.wishlistItem,
    required this.controller,
  });
  final WishlistModel wishlistItem;
  final WishlistController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 28, 10),
      decoration: BoxDecoration(
          color: AppColors.kSecondColorGrey2,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius05))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.screenHeight * 0.02)),
            child: CachedNetworkImage(
              imageUrl: wishlistItem.thumbnail ?? defaultImage,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>  const Icon(Icons.image_not_supported_outlined,size: 100, color: Colors.grey)
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
                  text: wishlistItem.title!,
                  maxLines: 2,
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTitle(
                  text: "\$${wishlistItem.price}",
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
            onTap: () => controller.removeFromWishList(wishlistItem),
            child: Icon(
              Icons.remove,
              color: Colors.red,
              size: Dimensions.screenHeight * 0.035,
            ),
          ))
        ],
      ),
    );
  }
}
