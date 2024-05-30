// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/delivery/food_card/cart_count/cart_count.dart';
import 'package:yum_dash/theme/colors.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? kBlackColor
            : kWhiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 6,
          ),
          CartCount(
            count: count,
            onRemovePressed: () {
              setState(() {
                count != 0 ? count-- : 0;
              });
            },
            onAddPressed: () {
              setState(() {
                count++;
              });
            },
          ),
          _AddToCardButton(),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }

  Widget _AddToCardButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add to card',
            style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w400),
          ),
          Text('₹150'),
        ],
      ),
    );
  }
}
