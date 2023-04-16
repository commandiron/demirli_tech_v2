import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_padding.dart';
import '../../../../config/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.backgroundAsset, required this.iconAsset, required this.name, required this.shortDescription}) : super(key: key);

  final String backgroundAsset;
  final String iconAsset;
  final String name;
  final String shortDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hL!,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Image.asset(backgroundAsset, fit: BoxFit.cover,)
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: AppPadding.allXXL,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
