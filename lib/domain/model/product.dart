class Product {
  Product({
    required this.backgroundAsset,
    required this.iconAsset,
    required this.name,
    required this.shortDescription,
    this.webUrl,
    this.appStoreUrl,
    this.googlePlayUrl,
  });

  final String backgroundAsset;
  final String iconAsset;
  final String name;
  final String shortDescription;
  final String? webUrl;
  final String? appStoreUrl;
  final String? googlePlayUrl;

  static List<Product> getItems() {
    return [
      Product(
        backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
        iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
        name: "Qr Projem",
        shortDescription: "Qr Projem, inşaat projeleri için özel QR kodları oluşturmanızı sağlayan bir platformdur.",
        webUrl: "https://qrprojem.com",
      ),
      Product(
          backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
          iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
          name: "Qr Projem",
          shortDescription: "Qr Projem, inşaat projeleri için özel QR kodları oluşturmanızı sağlayan bir platformdur."
      ),
      Product(
          backgroundAsset: "assets/images/products/qr_projem/reference_qr_image_1.png",
          iconAsset: "assets/images/products/qr_projem/qr_projem_logo.png",
          name: "Qr Projem",
          shortDescription: "Qr Projem, inşaat projeleri için özel QR kodları oluşturmanızı sağlayan bir platformdur."
      ),
    ];
  }
}