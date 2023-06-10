import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/home/sections/about/about_section.dart';
import 'package:demirli_tech_v2/home/sections/contact_us/contact_us_section.dart';
import 'package:demirli_tech_v2/home/sections/copyright_footer/copyright_footer.dart';
import 'package:demirli_tech_v2/home/sections/welcome/welcome_section.dart';
import 'package:demirli_tech_v2/ui_model/product.dart';
import 'package:flutter/material.dart';

import '../home/sections/products/products_section.dart';

class BodySection {
  BodySection(
    {
      required this.index,
      this.title,
      required this.screenHeight,
      required this.offset,
      required this.bgColor,
      this.bgImageAsset,
      this.showInAppBar = true,
      this.showTitleAsHeader = true,
      required this.section
    }
  );

  final int index;
  final String? title;
  final double screenHeight;
  final double offset;
  final Color bgColor;
  final String? bgImageAsset;
  final bool showInAppBar;
  final bool showTitleAsHeader;
  final Widget section;

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

    double productsOffset = welcomeOffset + welcomeHeight;
    double aboutOffset = productsOffset + productsHeight;
    double ourVisionOffset = aboutOffset + aboutHeight;
    double contactUsOffset = ourVisionOffset + ourVisionHeight;
    double copyrightFooterOffset = contactUsOffset + contactUsHeight;

    return [
      BodySection(
          index: 0,
          title: "Ana Sayfa",
          screenHeight: welcomeHeight,
          offset: welcomeOffset,
          bgColor: Theme.of(context).colorScheme.primaryContainer,
          showInAppBar: false,
          showTitleAsHeader: false,
          section: const WelcomeSection()
      ),
      BodySection(
          index: 1,
          title: "Ürünlerimiz",
          screenHeight: productsHeight,
          offset: productsOffset,
          bgColor: Theme.of(context).colorScheme.secondaryContainer,
          section: ProductsSection(
            products: Product.getItems(),
          )),
      BodySection(
          index: 2,
          title: "Hakkımızda",
          screenHeight: aboutHeight,
          offset: aboutOffset,
          bgColor: Theme.of(context).colorScheme.primaryContainer,
          section: const AboutSection()
      ),
      BodySection(
          index: 3,
          title: "Vizyonumuz",
          screenHeight: ourVisionHeight,
          offset: ourVisionOffset,
          bgColor: Theme.of(context).colorScheme.secondaryContainer,
          section: const SizedBox.shrink()
      ),
      BodySection(
          index: 4,
          title: "Bize ulaşın",
          screenHeight: contactUsHeight,
          offset: contactUsOffset,
          bgColor: Theme.of(context).colorScheme.tertiaryContainer,
          showTitleAsHeader: false,
          section: const ContactUsSection()),
      BodySection(
          index: 5,
          title: "Copyright Footer",
          screenHeight: copyrightFooterHeight,
          offset: copyrightFooterOffset,
          bgColor: Theme.of(context).colorScheme.tertiaryContainer,
          showInAppBar: false,
          showTitleAsHeader: false,
          section: const CopyrightFooter()),
    ];
  }
}
