import 'package:flutter/material.dart';

class MyNavDrawer extends StatelessWidget {
  const MyNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(children: [
      DrawerHeader(
        child: Image.asset(
          'assets/logo-color.png',
          width: 54,
          height: 54,
        ),
      )
    ]);
  }
}
