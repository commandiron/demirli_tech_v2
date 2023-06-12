import 'package:carousel_slider/carousel_slider.dart';
import 'package:demirli_tech_v2/compatibility/adaptive.dart';
import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/domain/app_event.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/carousel_move_buttons.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/product_item.dart';
import 'package:demirli_tech_v2/widgets/section_decorative_title.dart';
import 'package:demirli_tech_v2/widgets/section_title.dart';
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
      buildWhen: (previous, current) {
        return previous.productsAnimationState != current.productsAnimationState;
      },
      builder: (context, state) {
        return Stack(
          children: [
            SectionDecorativeTitle(
              title: "ÜRÜNLERİMİZ",
              decorativeTitleAnimationDuration: state.productsAnimationState.decorativeTitleAnimationDuration,
              decorativeTitleContainerHeight: state.productsAnimationState.decorativeTitleContainerHeight
            ),
            Column(
              children: [
                SectionTitle(
                  title: "ÜRÜNLERİMİZ",
                  titleLineAnimationDuration: state.productsAnimationState.titleLineAnimationDurationInSecond,
                  titleLineWidth: state.productsAnimationState.titleLineWidth,
                  decorativeTitleColor: Colors.white,
                  decorativeTitleAnimationDuration: state.productsAnimationState.decorativeTitleAnimationDuration,
                  decorativeTitleContainerHeight: state.productsAnimationState.decorativeTitleContainerHeight,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedSlide(
                      duration: Duration(milliseconds: state.productsAnimationState.sliderAnimationDuration),
                      offset: Offset(0,state.productsAnimationState.sliderOffsetY,),
                      curve: Curves.easeOutCubic,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: state.productsAnimationState.sliderAnimationDuration),
                        opacity: state.productsAnimationState.sliderOpacity,
                        child: CarouselSlider(
                          carouselController: state.productsCarouselController,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height - LayoutDimensions.sectionTitleHeight,
                              enableInfiniteScroll: false,
                              scrollPhysics: Adaptive.carouselScrollPhysics
                          ),
                          items: products.map((product) {
                            return ProductItem(
                              backgroundAsset: product.backgroundAsset,
                              iconAsset: product.iconAsset,
                              name: product.name,
                              shortDescription: product.shortDescription,
                              webUrl: product.webUrl,
                              appStoreUrl: product.appStoreUrl,
                              googlePlayUrl: product.googlePlayUrl,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    AnimatedSlide(
                      duration: Duration(milliseconds: state.productsAnimationState.buttonsAnimationDuration),
                      offset: Offset(state.productsAnimationState.backButtonOffsetX, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: AppPadding.hXL!,
                        child: CarouselBackButton(
                          onTap: () => context.read<AppBloc>().add(ProductsCarouselBack())
                        ),
                      ),
                    ),
                    AnimatedSlide(
                      duration: Duration(milliseconds: state.productsAnimationState.buttonsAnimationDuration),
                      offset: Offset(state.productsAnimationState.nextButtonOffsetX, 0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: AppPadding.hXL!,
                        child: CarouselNextButton(
                            onTap: () => context.read<AppBloc>().add(ProductsCarouselNext())
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
