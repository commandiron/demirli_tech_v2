import 'package:flutter/material.dart';

import '../../../../config/app_padding.dart';
import '../../../../config/app_space.dart';
import '../../../../config/app_text_style.dart';
import '../../../../helper/url_launcher.dart';

class WebSiteBadge extends StatelessWidget {
  const WebSiteBadge({super.key, required this.webUrl});
  final String webUrl;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: Colors.grey))),
        onPressed: () => openURL(webUrl),
        child: Container(
          height: 60,
          padding: AppPadding.hM!,
          child: Row(
            children: [
              Text(
                "Web Sitesine Git",
                style: AppTextStyle.b2!,
              ),
              AppSpace.hM!,
              const Icon(Icons.link)
            ],
          ),
        ));
  }
}

class AppStoreBadge extends StatelessWidget {
  const AppStoreBadge({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/badges/app_store_badge.png",
      height: 60,
    );
  }
}

class GooglePlayBadge extends StatelessWidget {
  const GooglePlayBadge({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/badges/google_play_badge.png",
      height: 60,
    );
  }
}
