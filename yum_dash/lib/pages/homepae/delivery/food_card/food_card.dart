import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/delivery/food_item_screen/food_item_screen.dart';

import 'package:yum_dash/theme/colors.dart';

import 'cart_count/cart_count.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => goToFooDItemPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          height: height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? kBlackColor
                : kWhiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/thalicat.avif'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'FarmHouse \nBrunch Bonnanza',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text('₹150 | 10-15 min'),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
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
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToFooDItemPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FoodItemScreen(),
      ),
    );
  }
}
