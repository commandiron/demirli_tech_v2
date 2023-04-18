import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:flutter/material.dart';

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
            padding: AppPadding.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: Colors.grey))),
        onPressed: () => openURL(webUrl),
        child: SizedBox(
          height: 60,
          width: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Web Sitesine Git",
                style: AppTextStyle.b2!,
              ),
              AppSpace.hM!,
              const Icon(Icons.open_in_new)
            ],
          ),
        ));
  }
}

class WebBadge extends StatelessWidget {
  const WebBadge({super.key, this.url});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: url == null ? null : () => openURL(url!),
      child: Image.asset(
        "assets/images/badges/web_badge.png",
        height: 60,
      ),
    );
  }
}

class AppStoreBadge extends StatelessWidget {
  const AppStoreBadge({super.key, this.url});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: url == null ? null : () => openURL(url!),
      child: Image.asset(
        "assets/images/badges/app_store_badge.png",
        height: 60,
      ),
    );
  }
}

class GooglePlayBadge extends StatelessWidget {
  const GooglePlayBadge({super.key, this.url});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: url == null ? null : () => openURL(url!),
      child: Image.asset(
        "assets/images/badges/google_play_badge.png",
        height: 60,
      ),
    );
  }
}
