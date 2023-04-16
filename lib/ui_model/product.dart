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