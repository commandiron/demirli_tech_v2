import 'package:demirli_tech_v2/ui_model/product.dart';
import 'package:flutter/material.dart';

import '../home/sections/products/products_section.dart';

class BodySection{
  BodySection(
    {
      this.title,
      required this.screenHeight,
      required this.offset,
      required this.color,
      this.showButton = true,
      this.section
    }
  );

  final String? title;
  final double screenHeight;
  final double offset;
  final Color color;
  final bool showButton;
  final Widget? section;

  static List<BodySection> getItems(BuildContext context) {
    const double welcomeHeight = 960;
    const double aboutHeight = 360;
    const double productsHeight = 960;
    const double ourVisionHeight = 720;
    const double contactUsHeight = 360;
    const double copyrightFooterHeight = 45;

    const double welcomeOffset = 0;
    const double aboutOffset = welcomeOffset + welcomeHeight;
    const double productsOffset = aboutOffset + aboutHeight;
    const double ourVisionOffset = productsOffset + productsHeight;
    const double contactUsOffset = ourVisionOffset + ourVisionHeight;
    const double copyrightFooterOffset = contactUsOffset + contactUsHeight;

    return [
      BodySection(title: "Ana Sayfa", screenHeight: welcomeHeight, offset: welcomeOffset, color: Colors.purple, showButton: false),
      BodySection(title: "Hakkımızda", screenHeight: aboutHeight, offset: aboutOffset, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Ürünlerimiz", screenHeight: productsHeight, offset: productsOffset, color: Theme.of(context).colorScheme.secondaryContainer, section: ProductsSection(products: Product.getItems(),)),
      BodySection(title: "Vizyonumuz", screenHeight: ourVisionHeight, offset: ourVisionOffset, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Bize ulaşın", screenHeight: contactUsHeight, offset: contactUsOffset, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(screenHeight: copyrightFooterHeight, offset: copyrightFooterOffset, color: Theme.of(context).colorScheme.primaryContainer, showButton: false),
    ];
  }
}