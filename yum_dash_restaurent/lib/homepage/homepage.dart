import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:yum_dash_restaurent/homepage/options_screen/option_screen.dart';

import '../theme/colors.dart';
import 'insight_screen/insight_screen.dart';
import 'menu_screen/menu_screen.dart';
import 'order/order_screen.dart';

//home screen
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //default screen index page
  int _selectedIndex = 0;

  //change page method
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _controller = ValueNotifier<bool>(false);

  List<Widget> pages = const [
    OrderScreen(),
    MenuScreen(),
    InsightScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //get device width
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 0.3,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AdvancedSwitch(
            width: width * 0.22,
            controller: _controller,
            activeColor: lightGreen,
            activeChild: const Text('Online'),
            inactiveColor: kRed,
            inactiveChild: const Text('Offline'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => goToOptions(context),
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: kGrey,
          onTap: changeScreen,
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

  //navigate to option screen
  goToOptions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OptionScreen(),
      ),
    );
  }
}
