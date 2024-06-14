import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/homepage/menu_screen/add_item/add_item.dart';
import 'package:yum_dash_restaurent/theme/theme.dart';
import 'menu_card/menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
        SliverList.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return const MenuCard();
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => goToAddItem(context),
          label: const Row(
            children: [
              Icon(Icons.add),
              Text('ADD'),
            ],
          )),
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
}
