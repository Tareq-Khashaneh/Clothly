import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothly/core/constants/images.dart';
import 'package:clothly/core/shared/custom_icon.dart';
import 'package:clothly/features/product_detail/data/models/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_title.dart';


class CartProductCard extends StatelessWidget {
  const CartProductCard(
      {super.key, required this.cartProduct,});
  final CartProductModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          // clipper: MyCustomClipper()..getClip(size),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.screenHeight * 0.02)),
          // clipper: MyCustomClipper()..getClip(size),
          child: CachedNetworkImage(
            imageUrl: cartProduct.wishlistItem.image ?? defaultImage,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),


            fit: BoxFit.cover, width: 80, // Set width here
            height: 90,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                text: cartProduct.wishlistItem.title!,
                maxLines: 2,
                fontSize: 18,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomTitle(
                text: cartProduct.wishlistItem.category!,
                fontSize: 16,
                color: AppColors.kSecondColorGrey,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTitle(
                text: "\$${cartProduct.wishlistItem.price}",
                fontSize: 20,
              )
              // Text(""
              // Text("")
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomIcon(icon: const Icon(Icons.delete_outlined,color: Colors.red,),circleColor: AppColors.kSecondColorGrey2.withOpacity(0.3),),
              SizedBox(
                height: Dimensions.screenHeight * 0.04,
              ),
              Container(
                width: Dimensions.screenWidth * 0.24,
                height: Dimensions.screenHeight * 0.04,
                decoration: BoxDecoration(
                    color: AppColors.kMainColorBlack2,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                      color: Colors.white,
                    ),
                    Text(
                      cartProduct.number.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
