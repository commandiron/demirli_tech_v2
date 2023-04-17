import 'package:carousel_slider/carousel_slider.dart';
import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/carousel_move_button.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../ui_model/product.dart';


class ProductsSection extends StatefulWidget {
  const ProductsSection({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 720.0,
            enableInfiniteScroll: false
          ),
          items: widget.products.map((product) {
            return Builder(
              builder: (BuildContext context) {
                return ProductItem(
                  backgroundAsset: product.backgroundAsset,
                  iconAsset: product.iconAsset,
                  name: product.name,
                  shortDescription: product.shortDescription,
                  webUrl: product.webUrl,
                  appStoreUrl: product.appStoreUrl,
                  googlePlayUrl: product.googlePlayUrl,
                );
              }
            );
          }).toList(),
        ),
        Padding(
          padding: AppPadding.hXL!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarouselBackButton(
                onTap: () => _controller.previousPage(duration: const Duration(milliseconds: 500), 
                curve: Curves.ease),
              ),
              CarouselNextButton(
                onTap: () => _controller.nextPage(duration: const Duration(milliseconds: 500), 
                curve: Curves.ease),
              ),
            ],
          ),
        )
      ],
    );
  }
}