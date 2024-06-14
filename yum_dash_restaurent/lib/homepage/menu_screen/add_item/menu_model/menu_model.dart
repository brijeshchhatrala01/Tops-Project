class MenuModel {
  final String food_name;
  final String food_catagory;
  final String food_discription;
  final String food_indigrients;
  final int food_price;
  final int food_in_stock;
  final int food_is_recommanded;

  const MenuModel({
    required this.food_name,
    required this.food_catagory,
    required this.food_discription,
    required this.food_indigrients,
    required this.food_price,
    required this.food_in_stock,
    required this.food_is_recommanded,
  });
}
