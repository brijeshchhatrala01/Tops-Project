import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).brightness == Brightness.dark
              ? kBlackColor
              : kWhiteAppBar,
          border: Border.all(color: kBlackColor, width: 1)),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/veg_logo.jpg',
                    width: 24,
                    height: 24,
                  ),
                  const Text(
                    'Vegetable Salad',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    '₹150.00',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                      'This is the description of this item \nand it will only have two line')
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/logo_zomato.png',
                    width: 92,
                    height: 92,
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child:
                          IconButton(onPressed: null, icon: Icon(Icons.image)))
                ],
              )
            ],
          ),
          const Row(
            children: [
              Expanded(child: Divider()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.thumb_up)),
                  Text('Recommend')
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const Text('In Stock'),
                ],
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.edit)),
                  Text('Edit'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
