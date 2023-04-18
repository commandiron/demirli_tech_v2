import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/home/sections/products/widgets/badges.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_padding.dart';
import '../../../../config/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.backgroundAsset, required this.iconAsset, required this.name, required this.shortDescription, this.webUrl, this.appStoreUrl, this.googlePlayUrl}) : super(key: key);

  final String backgroundAsset;
  final String iconAsset;
  final String name;
  final String shortDescription;
  final String? webUrl;
  final String? appStoreUrl;
  final String? googlePlayUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hL!.add(EdgeInsets.only(bottom: 64)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Image.asset(backgroundAsset, fit: BoxFit.cover,)
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: AppPadding.hXXL!.add(AppPadding.vXXL!),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(16)
                        )
                      ),
                      child: Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(iconAsset,),
                      ),
                    ),
                    AppSpace.hL!,
                    Text(name, style: AppTextStyle.h2b!.copyWith(color: Colors.white),)
                  ],
                ),
                AppSpace.vXXL!,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        shortDescription,
                        style: AppTextStyle.b1b!.copyWith(
                          color: Colors.white,
                          height: 2
                        ),
                      )
                    ),
                    AppSpace.hExpanded!
                  ],
                ),
                AppSpace.vXXL!,
                Row(
                  children: [
                    if(webUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: WebSiteBadge(webUrl: webUrl!)
                      ),
                    if(appStoreUrl == null)
                      const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: AppStoreBadge(),
                      ),
                    if(googlePlayUrl == null)
                      const GooglePlayBadge()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
