import 'package:flutter/material.dart';

class CartCount extends StatelessWidget {
  final int count;
  final void Function()? onRemovePressed;
  final void Function()? onAddPressed;
  const CartCount({
    super.key,
    required this.count,
    required this.onRemovePressed,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: onRemovePressed, icon: const Icon(Icons.remove)),
          Text(
            count.toString(),
          ),
          IconButton(onPressed: onAddPressed, icon: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
