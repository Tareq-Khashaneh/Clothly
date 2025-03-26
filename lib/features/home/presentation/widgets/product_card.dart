import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothly/core/constants/images.dart';
import 'package:clothly/core/constants/routes.dart';
import 'package:clothly/features/home/data/models/product_model.dart';
import 'package:clothly/features/home/logic/home_controller.dart';
import 'package:flutter/material.dart';
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
      onTap: () => Get.toNamed(AppRoutes.detailsRoute, arguments: product),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.kSecondColorGrey2.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Dimensions.radius04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? defaultImage,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      if (product.description != null)
                        Text(
                          product.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.grey),
                        ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () => controller.toggleFavorite(product: product),
                            icon: Icon(
                              product.isWishlist ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      if (product.size != null)
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.kSecondColorGrey.withOpacity(0.2),
                          ),
                          child: Text(
                            product.size!,
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
