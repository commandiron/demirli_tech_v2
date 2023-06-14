import 'package:flutter/material.dart';

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
    required this.showInAppBar,
    required this.section
  });

  final int index;
  final String title;
  final bool showInAppBar;
  final Widget section;

  static final List<BodySection> items = [
    BodySection(
        index: WelcomeSection.index,
        title: WelcomeSection.title,
        showInAppBar: false,
        section: const WelcomeSection()
    ),
    BodySection(
      index: ProductsSection.index,
      title: ProductsSection.title,
      showInAppBar: true,
      section: const ProductsSection(),
    ),
    BodySection(
        index: AboutSection.index,
        title: AboutSection.title,
        showInAppBar: true,
        section: const AboutSection()
    ),
    BodySection(
        index: OurVisionSection.index,
        title: OurVisionSection.title,
        showInAppBar: true,
        section: const OurVisionSection()
    ),
    BodySection(
        index: ContactUsSection.index,
        title: ContactUsSection.title,
        showInAppBar: true,
        section: const ContactUsSection()),
    BodySection(
        index: CopyrightFooter.index,
        title: CopyrightFooter.title,
        showInAppBar: false,
        section: const CopyrightFooter()),
  ];
}