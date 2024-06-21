// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../theme/colors.dart';
import '../edit_food_item/edit_food_item.dart';

class MenuCard extends StatefulWidget {
  final String foodId;
  final String foodName;
  final String foodDiscription;
  final String foodPrice;
  final String foodImage;
  final String foodCatagory;
  final String isRecommanded;
  final String inStock;

  const MenuCard({
    super.key,
    required this.foodId,
    required this.foodName,
    required this.foodDiscription,
    required this.foodImage,
    required this.foodPrice,
    required this.foodCatagory,
    required this.isRecommanded,
    required this.inStock,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  late bool foodInStock;

  late bool foodIsRecommanded;

  @override
  void initState() {
    foodInStock = widget.inStock == 0 ? false : true;
    foodIsRecommanded = widget.isRecommanded == 0 ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(foodInStock.toString());
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
                    widget.foodCatagory.toString() != 'non-veg'
                        ? 'assets/veg_logo.jpg'
                        : 'assets/non_veg.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    widget.foodName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '₹${widget.foodPrice}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(widget.foodDiscription)
                ],
              ),
              Image.network(
                widget.foodImage,
                width: 92,
                height: 92,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      foodIsRecommanded = !foodIsRecommanded;
                      await updateFoodIsRecommanded(
                          widget.foodId, foodIsRecommanded);
                      setState(() {});
                    },
                    icon: foodIsRecommanded
                        ? const Icon(
                            Icons.thumb_up,
                            color: kBlue,
                          )
                        : const Icon(
                            Icons.thumb_up,
                            color: kGrey,
                          ),
                  ),
                  const Text('Recommend')
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: lightGreen,
                      value: foodInStock,
                      onChanged: (value) async {
                        foodInStock = !foodInStock;
                        await updateFoodInStock(widget.foodId, foodInStock);
                        setState(() {});
                      },
                    ),
                  ),
                  const Text('In Stock'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () => goToEditFoodItem(context),
                      icon: const Icon(
                        Icons.edit,
                        color: kGrey,
                      )),
                  const Text('Edit'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Future updateFoodInStock(String foodId, bool foodInStock) async {
    var url = Uri.parse(
        'https://gleg-span.000webhostapp.com/yum_dash/menu/updateFoodStock.php');
    var res = await http.post(url, body: {
      'id': foodId,
      'food_in_stock': foodInStock == true ? 1.toString() : 0.toString()
    });
    debugPrint(
        'widget ${widget.inStock} ID : ${foodId} , foodInStock : ${foodInStock.toString()} Response after stock update : ${res.statusCode}');
  }

  Future updateFoodIsRecommanded(String foodId, bool foodIsRecommanded) async {
    var url = Uri.parse(
        'https://gleg-span.000webhostapp.com/yum_dash/menu/updateFoodRecommanded.php');
    var res = await http.post(url, body: {
      'id': foodId,
      'food_is_recommanded':
          foodIsRecommanded == true ? 1.toString() : 0.toString()
    });
    debugPrint(
        'widget ${widget.inStock} ID : ${foodId} , foodInStock : ${foodIsRecommanded.toString()} Response after stock update : ${res.statusCode}');
  }

  goToEditFoodItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFoodItem(foodId: widget.foodId),
      ),
    );
  }
}
