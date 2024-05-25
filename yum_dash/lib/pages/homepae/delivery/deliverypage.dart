import 'package:flutter/material.dart';

import '../../../appbar/appbar.dart';
import '../../../appbar/search_appbar.dart';
import '../../../theme/colors.dart';
import '../custom_widgets/header_homepage.dart';
import 'food_card/food_card.dart';

//delivery page
class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  List images = [
    'assets/image1.avif',
    'assets/image2.avif',
    'assets/image3.avif',
    'assets/image4.avif',
    'assets/image5.avif',
    'assets/image6.avif',
    'assets/image7.avif',
    'assets/image8.avif',
    'assets/image9.avif',
  ];

  bool isFavorit = false;

  final _searchFood = TextEditingController();

  bool isShowRecommanded = true;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: () async {},
      child: SafeArea(
        child: CustomScrollView(slivers: [
          const CustomAppBar(),
          SearchAppBar(
            hintText: 'Search Pav Bhaji',
            searchFood: _searchFood,
            onPressed: null,
          ),
          HeaderHomepage(
            displayWidth: displayWidth,
            onPressedRecommanded: () {
              setState(() {
                isShowRecommanded = true;
              });
            },
            onPressedFavorit: () {
              setState(() {
                isShowRecommanded = false;
              });
            },
          ),
          //recommanded Items in grid view

          isShowRecommanded
              ? SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height:
                        displayHeight > 400 ? displayHeight / 3 : displayHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: List.generate(
                          images.length,
                          (index) => Stack(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  children: [
                                    Opacity(
                                      opacity: 0.7,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          images[index],
                                          width: displayWidth / 3,
                                          height: displayHeight > 400
                                              ? displayHeight / 12
                                              : displayHeight / 2.9,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text("La Pino'z Pizza"),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              size: 14,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              '23 mins',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorit = !isFavorit;
                                  });
                                },
                                icon: isFavorit
                                    ? const Icon(
                                        Icons.favorite,
                                        color: primaryColorWhite,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined),
                              ),
                            ),
                            const Positioned(
                              bottom: 52,
                              left: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('50% OFF'),
                                  Text('up to ₹100'),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                )
              : const SliverToBoxAdapter(),

          SliverList(
            delegate: SliverChildListDelegate(
                List.generate(images.length, (index) => const FoodCard())),
          ),
        ]),
      ),
    );
  }
}
