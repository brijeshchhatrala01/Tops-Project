import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_widgets.dart';

//homepage header with particular food dish
class HeaderHomepage extends StatelessWidget {
  const HeaderHomepage({
    super.key,
    required this.displayWidth,
    required this.onPressedRecommanded,
    required this.onPressedFavorit,
  });

  final double displayWidth;
  final void Function()? onPressedRecommanded;
  final void Function()? onPressedFavorit;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        smallSizedBox,
        CarouselSlider(
          items: [
            Image.asset(
              'assets/pizzacat.avif',
              fit: BoxFit.cover,
            ),
            Image.asset('assets/dosacat.avif', fit: BoxFit.cover),
            Image.asset('assets/northindiacat.avif', fit: BoxFit.cover),
          ],
          options: CarouselOptions(
            aspectRatio: 1,
            autoPlay: true,
            height: 180,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        smallSizedBox,
        Column(
          children: [
            const Center(
              child: Text('FOR YOU'),
            ),
            smallSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: onPressedRecommanded,
                  child: const Text('Recommended'),
                ),
                FilledButton.icon(
                  onPressed: onPressedFavorit,
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Favourites'),
                ),
              ],
            ),
            smallSizedBox,
          ],
        )
      ]),
    );
  }
}
