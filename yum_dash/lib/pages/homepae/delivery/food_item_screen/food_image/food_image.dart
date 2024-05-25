import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yum_dash/theme/colors.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.45,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kBlackColor
                        : kWhiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: kGolden,
                            ),
                            const Text(
                              '4.6',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              const Text(
                'Savory Streete Eats',
                style: TextStyle(color: kBlackColor, fontSize: 16),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Mediterian Sunshine \nBowl',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.all(15),
                    width: width * 0.5,
                    height: height * 0.24,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(-1, 10),
                        blurRadius: 10,
                      )
                    ]),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'assets/thalicat.avif',
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
