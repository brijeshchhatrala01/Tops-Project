import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/delivery/food_card/food_card.dart';
import 'package:yum_dash/theme/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'C A R T',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return FoodCard();
              },
            ),
          ),
          _buildCheckOut(context),
        ],
      ),
    );
  }

  Widget _buildCheckOut(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Total : ₹ 450',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w200,
              color: Theme.of(context).brightness == Brightness.dark
                  ? kWhiteColor
                  : kWhiteColor,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kBlackColor
                      : kWhiteColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'C H E C K O U T',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBlackColor
                        : kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
