import 'package:carousel_slider/carousel_slider.dart';
import 'package:demirli_tech_v2/compatibility/adaptive.dart';
import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/domain/app_event.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/carousel_move_button.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_bloc.dart';
import '../../../domain/app_state.dart';
import '../../../ui_model/product.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AnimatedSlide(
          duration: const Duration(seconds: 1),
          offset: Offset(state.productsAnimationState.offsetX, 0),
          curve: Curves.easeOutCubic,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                carouselController: state.productsCarouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height - LayoutDimensions.bodyBaseTitleHeight,
                    enableInfiniteScroll: false,
                    scrollPhysics: Adaptive.carouselScrollPhysics
                ),
                items: products.map((product) {
                  return Builder(builder: (BuildContext context) {
                    return ProductItem(
                      backgroundAsset: product.backgroundAsset,
                      iconAsset: product.iconAsset,
                      name: product.name,
                      shortDescription: product.shortDescription,
                      webUrl: product.webUrl,
                      appStoreUrl: product.appStoreUrl,
                      googlePlayUrl: product.googlePlayUrl,
                    );
                  });
                }).toList(),
              ),
              Padding(
                padding: AppPadding.hXL!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarouselBackButton(
                      onTap: () => context.read<AppBloc>().add(ProductsCarouselBack())
                    ),
                    CarouselNextButton(
                      onTap: () => context.read<AppBloc>().add(ProductsCarouselNext())
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
