import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/home/sections/contact_us/contact_us_section.dart';
import 'package:demirli_tech_v2/home/sections/copyright_footer/copyright_footer.dart';
import 'package:demirli_tech_v2/ui_model/product.dart';
import 'package:flutter/material.dart';

import '../home/sections/products/products_section.dart';

class BodySection {
  BodySection(
      {this.title,
      required this.screenHeight,
      required this.offset,
      required this.color,
      this.showInAppBar = true,
      this.showTitleAsHeader = true,
      this.section});

  final String? title;
  final double screenHeight;
  final double offset;
  final Color color;
  final bool showInAppBar;
  final bool showTitleAsHeader;
  final Widget? section;

  static const double welcomeMinHeight = 650 - LayoutDimensions.appBarHeight;
  static const double productsMinHeight = 650 - LayoutDimensions.appBarHeight;

  static List<BodySection> getItems(BuildContext context) {
    double welcomeHeight =
        MediaQuery.of(context).size.height - LayoutDimensions.appBarHeight;
    if (welcomeHeight < welcomeMinHeight) {
      welcomeHeight = welcomeMinHeight;
    }

    const double aboutHeight = 360;

    double productsHeight = MediaQuery.of(context).size.height;
    if (productsHeight < productsMinHeight) {
      productsHeight = productsMinHeight;
    }
    const double ourVisionHeight = 600;
    const double contactUsHeight = 360;
    const double copyrightFooterHeight = 60;

    const double welcomeOffset = 0;
    double aboutOffset = welcomeOffset + welcomeHeight;
    double productsOffset = aboutOffset + aboutHeight;
    double ourVisionOffset = productsOffset + productsHeight;
    double contactUsOffset = ourVisionOffset + ourVisionHeight;
    double copyrightFooterOffset = contactUsOffset + contactUsHeight;

    return [
      BodySection(
          title: "Ana Sayfa",
          screenHeight: welcomeHeight,
          offset: welcomeOffset,
          color: Colors.purple,
          showInAppBar: false),
      BodySection(
          title: "Hakkımızda",
          screenHeight: aboutHeight,
          offset: aboutOffset,
          color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(
          title: "Ürünlerimiz",
          screenHeight: productsHeight,
          offset: productsOffset,
          color: Theme.of(context).colorScheme.secondaryContainer,
          section: ProductsSection(
            products: Product.getItems(),
          )),
      BodySection(
          title: "Vizyonumuz",
          screenHeight: ourVisionHeight,
          offset: ourVisionOffset,
          color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(
          title: "Bize ulaşın",
          screenHeight: contactUsHeight,
          offset: contactUsOffset,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          showTitleAsHeader: false,
          section: const ContactUsSection()),
      BodySection(
          title: "Copyright Footer",
          screenHeight: copyrightFooterHeight,
          offset: copyrightFooterOffset,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          showInAppBar: false,
          showTitleAsHeader: false,
          section: const CopyrightFooter()),
    ];
  }
}
