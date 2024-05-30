import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../theme/colors.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => null,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    child: RatingBar.builder(
                      initialRating: 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/chili_rate.png',
                          fit: BoxFit.fill,
                        );
                      },
                      onRatingUpdate: (value) {},
                    ),
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/thalicat.avif'),
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FarmHouse \nBrunch Bonnanza',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Qauntity : 4',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ElevatedButton(onPressed: null, child: Text('R E A D Y'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
