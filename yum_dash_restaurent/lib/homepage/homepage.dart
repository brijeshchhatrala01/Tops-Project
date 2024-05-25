import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../theme/colors.dart';
import 'insight/insight.dart';
import 'menu/menu.dart';
import 'order/order.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //default index page
  int _selectedIndex = 0;

  //change page method
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _controller = ValueNotifier<bool>(false);

  List<Widget> pages = const [
    OrderPage(),
    MenuPage(),
    InsightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 0.3,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AdvancedSwitch(
            width: width * 0.22,
            controller: _controller,
            activeColor: Colors.lightGreen,
            activeChild: const Text('Online'),
            inactiveColor: Colors.red,
            inactiveChild: const Text('Offline'),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () => goToMenu(), icon: Icon(Icons.menu))
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: kGrey,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.room_service), label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu), label: "Menu"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Insight"),
          ]),
    );
  }

  goToMenu() {}
}
