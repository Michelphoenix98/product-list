class Product {
  final thumbnail;
  final String displayName;
  final double salePrice;
  final double maximumRetailPrice;

  Product({
    this.thumbnail,
    required this.displayName,
    required this.salePrice,
    required this.maximumRetailPrice,
  });

  factory Product.fromJson(Map data) {
    return Product(
      thumbnail: data["thumbnail"],
      displayName: data["display_name"],
      salePrice: data["sale_price"],
      maximumRetailPrice: data["mrp"],
    );
  }
}
