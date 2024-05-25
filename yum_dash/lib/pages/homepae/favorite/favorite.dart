import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yum_dash/appbar/appbar.dart';
import 'package:yum_dash/appbar/search_appbar.dart';

import '../delivery/food_card/food_card.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const CustomAppBar(),
      SearchAppBar(
          hintText: 'Search Food',
          searchFood: _searchController,
          onPressed: null),
      SliverList.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const FoodCard();
        },
      ),
    ]);
  }
}
