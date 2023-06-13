import 'package:flutter/material.dart';

import '../../config/layout_dimensions.dart';
import '../../home/sections/about/about_section.dart';
import '../../home/sections/contact_us/contact_us_section.dart';
import '../../home/sections/copyright_footer/copyright_footer.dart';
import '../../home/sections/our_vision/our_vision_section.dart';
import '../../home/sections/products/products_section.dart';
import '../../home/sections/welcome/welcome_section.dart';

class BodySection {
  BodySection({
    required this.index,
    required this.title,
    required this.screenHeight,
    required this.offset,
    required this.bgColor,
    this.bgImageAsset,
    required this.showInAppBar,
    required this.section
  });

  final int index;
  final String title;
  final double screenHeight;
  final double offset;
  final Color bgColor;
  final String? bgImageAsset;
  final bool showInAppBar;
  final Widget section;

  static List<BodySection> getItems(BuildContext context) {

    const double welcomeMinHeight = 650 - LayoutDimensions.appBarHeight;
    const double productsMinHeight = 650 - LayoutDimensions.appBarHeight;

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
        index: WelcomeSection.index,
        title: WelcomeSection.title,
        screenHeight: welcomeHeight,
        offset: welcomeOffset,
        bgColor: Theme.of(context).colorScheme.primaryContainer,
        showInAppBar: false,
        section: const WelcomeSection()
      ),
      BodySection(
        index: ProductsSection.index,
        title: ProductsSection.title,
        screenHeight: productsHeight,
        offset: productsOffset,
        bgColor: Theme.of(context).colorScheme.secondaryContainer,
        showInAppBar: true,
        section: const ProductsSection(),
      ),
      BodySection(
        index: AboutSection.index,
        title: AboutSection.title,
        screenHeight: aboutHeight,
        offset: aboutOffset,
        bgColor: Theme.of(context).colorScheme.primaryContainer,
        showInAppBar: true,
        section: const AboutSection()
      ),
      BodySection(
        index: OurVisionSection.index,
        title: OurVisionSection.title,
        screenHeight: ourVisionHeight,
        offset: ourVisionOffset,
        bgColor: Theme.of(context).colorScheme.secondaryContainer,
        showInAppBar: true,
        section: const OurVisionSection()
      ),
      BodySection(
        index: ContactUsSection.index,
        title: ContactUsSection.title,
        screenHeight: contactUsHeight,
        offset: contactUsOffset,
        bgColor: Theme.of(context).colorScheme.tertiaryContainer,
        showInAppBar: true,
        section: const ContactUsSection()),
      BodySection(
        index: CopyrightFooter.index,
        title: CopyrightFooter.title,
        screenHeight: copyrightFooterHeight,
        offset: copyrightFooterOffset,
        bgColor: Theme.of(context).colorScheme.tertiaryContainer,
        showInAppBar: false,
        section: const CopyrightFooter()),
    ];
  }
}