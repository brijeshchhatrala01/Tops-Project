class MenuModel {
  final String image;
  final String name;
  final int price;
  final String discription;
  final bool isVeg;
  final bool inStock;
  final bool isRecommanded;

  const MenuModel({
    required this.image,
    required this.name,
    required this.price,
    required this.discription,
    required this.isVeg,
    required this.inStock,
    required this.isRecommanded,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'discription': discription,
      'isVeg': isVeg,
      'inStock': inStock,
      'isReccommanded': isRecommanded,
    };
  }
}
