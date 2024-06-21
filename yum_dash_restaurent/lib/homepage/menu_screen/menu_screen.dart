import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/homepage/menu_screen/add_item/add_item.dart';
import 'package:yum_dash_restaurent/theme/theme.dart';
import 'menu_card/menu_card.dart';
import 'package:http/http.dart' as http;

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: ThemeDataApp().getBackgroundColor(context),
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(42),
              bottomLeft: Radius.circular(42),
            ),
          ),
          toolbarHeight: height * 0.2,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search item by name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChoiceChip(label: Text('All Items'), selected: false),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(label: Text('Out Of Stock'), selected: false),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: FutureBuilder<List>(
            future: getMenuFromDatabase(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return MenuCard(
                          foodId: snapshot.data![index]['id'],
                          foodName: snapshot.data![index]['food_name'],
                          foodDiscription: snapshot.data![index]
                              ['food_discription'],
                          foodImage: snapshot.data![index]['food_image'],
                          foodPrice: snapshot.data![index]['food_price'],
                          foodCatagory: snapshot.data![index]['food_catagory'],
                          isRecommanded: snapshot.data![index]
                              ['food_is_recommanded'],
                          inStock: snapshot.data![index]['food_in_stock'],
                        );
                      },
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => goToAddItem(context),
        label: const Row(
          children: [
            Icon(Icons.add),
            Text('ADD'),
          ],
        ),
      ),
    );
  }

  goToAddItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddItem(),
      ),
    );
  }

  Future<List> getMenuFromDatabase() async {
    var url = Uri.parse(
        'https://gleg-span.000webhostapp.com/yum_dash/menu/get_menu_items.php');
    var req = await http.get(url);

    // debugPrint('Menu Data : ${jsonDecode(req.body)}');
    return jsonDecode(req.body);
  }
}
