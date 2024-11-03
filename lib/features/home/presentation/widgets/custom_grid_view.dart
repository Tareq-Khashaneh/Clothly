import 'package:ecommerce_clothing/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/dimensions.dart';
import '../../data/models/product_model.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing:
            Dimensions.screenHeight * 0.04,
            mainAxisExtent:
            Dimensions.screenHeight * 0.5,
            crossAxisSpacing:
            Dimensions.screenWidth * 0.08,
            crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductModel product =
          products[index];
          return ProductCard(product: product);
        });
  }
}
