import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/location/location.dart';

import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kAppBarColorDark
          : kWhiteColor,
      pinned: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  goToLocation(context);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      size: 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.expand_more)
                          ],
                        ),
                        Text(
                          'Dwarkesh Willa A-401...',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: lightGreen,
            ),
          )
        ],
      ),
    );
  }

  void goToLocation(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationPage(),
        ));
  }
}
