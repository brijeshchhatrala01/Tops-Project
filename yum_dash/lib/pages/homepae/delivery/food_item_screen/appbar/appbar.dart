import 'package:flutter/material.dart';
import 'package:yum_dash/theme/colors.dart';

class MyAppBar extends StatelessWidget {
  final void Function()? onBackTap;
  final void Function()? onFavoriteTap;
  const MyAppBar({
    super.key,
    required this.onBackTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 24,
        right: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackTap,
            child: _buildIcon(Icons.arrow_back),
          ),
          GestureDetector(
            onTap: onFavoriteTap,
            child: _buildIcon(Icons.favorite_border),
          )
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
      ),
      child: Icon(
        iconData,
        color: kBlackColor,
      ),
    );
  }
}
