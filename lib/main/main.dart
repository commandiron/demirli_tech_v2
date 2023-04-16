import 'package:carousel_slider/carousel_slider.dart';
import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/config/app_theme.dart';
import 'package:demirli_tech_v2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import '../config/app_config.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      title: "Demirli Tech",
      home: const MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomeScreen(bodySections: BodySection.getItems(context));
  }
}

class BodySection{
  BodySection(
    {
      required this.title,
      required this.screenHeight,
      required this.offset,
      required this.color,
      this.showButton = true,
      this.section
    }
  );

  final String title;
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
      BodySection(title: "Ürünlerimiz", screenHeight: productsHeight, offset: productsOffset, color: Theme.of(context).colorScheme.secondaryContainer, section: const ProductsSection()),
      BodySection(title: "Vizyonumuz", screenHeight: ourVisionHeight, offset: ourVisionOffset, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Bize ulaşın", screenHeight: contactUsHeight, offset: contactUsOffset, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(title: "Copyright Footer", screenHeight: copyrightFooterHeight, offset: copyrightFooterOffset, color: Theme.of(context).colorScheme.primaryContainer, showButton: false),
    ];
  }
}

class ProductsSection extends StatelessWidget {
  const ProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Product.getItems();
    return CarouselSlider(
      options: CarouselOptions(height: 720.0),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: AppPadding.hL!,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    child: Image.asset(product.backgroundAsset, fit: BoxFit.cover,)
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: AppPadding.allXXL,
                    child: Row(
                      children: [
                        Card(
                          margin: AppPadding.hL!,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16)
                            )
                          ),
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(12),
                            child: Image.asset(product.iconAsset,),
                          ),
                        ),
                        Text(product.name, style: AppTextStyle.h2b!.copyWith(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        );
      }).toList(),
    );
  }
}

class Product {
  Product(
    {
      required this.backgroundAsset,
      required this.iconAsset,
      required this.name
    }
  );

  final String backgroundAsset;
  final String iconAsset;
  final String name;

  static List<Product> getItems() {
    return [
      Product(
        backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
        iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
        name: "Qr Projem"
      ),
      Product(
          backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
          iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
          name: "Qr Projem"
      ),
      Product(
          backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
          iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
          name: "Qr Projem"
      ),
    ];
  }
}