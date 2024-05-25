import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'delivery/deliverypage.dart';
import 'favorite/favorite.dart';
import 'profile/profile.dart';

//homepage widget
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //list of different pages
  List<Widget> pages = [
    const DeliveryPage(),
    const Favorite(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    // getLocation();
    super.initState();
  }

  //default index page
  int _selectedIndex = 0;

  //change page method
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // //Position object to access long lat
  // Position? position;

  // //get location permission if not granted
  // void getLocation() async {
  //   var permissionLocation = await Permission.location.status;
  //   if (permissionLocation.isDenied) {
  //     await Permission.location.request();
  //     position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            unselectedItemColor: kGrey,
            onTap: changePage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "Menu"),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ]),
        //show body according to selected page
        body: pages[_selectedIndex]);
  }
}
