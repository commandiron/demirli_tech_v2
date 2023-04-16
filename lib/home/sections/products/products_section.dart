import 'package:carousel_slider/carousel_slider.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../ui_model/product.dart';


class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 720.0),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return ProductItem(
              backgroundAsset: product.backgroundAsset,
              iconAsset: product.iconAsset,
              name: product.name
            );
          }
        );
      }).toList(),
    );
  }
}