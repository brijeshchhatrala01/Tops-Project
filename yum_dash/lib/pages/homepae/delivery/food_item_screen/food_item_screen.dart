import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/delivery/food_item_screen/appbar/appbar.dart';
import 'package:yum_dash/pages/homepae/delivery/food_item_screen/cart_row/cart_row.dart';
import 'package:yum_dash/pages/homepae/delivery/food_item_screen/food_detail/food_detail.dart';
import 'package:yum_dash/pages/homepae/delivery/food_item_screen/food_image/food_image.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              onBackTap: () {
                Navigator.pop(context);
              },
              onFavoriteTap: () {},
            ),
            const FoodImage(),
            const FoodDetail(),
            const CartTile(),
          ],
        ),
      ),
    );
  }
}
