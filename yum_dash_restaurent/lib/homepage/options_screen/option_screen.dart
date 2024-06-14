import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/homepage/options_screen/user/user_screen.dart';
import 'package:yum_dash_restaurent/intro%20screen/intro.dart';
import 'package:yum_dash_restaurent/service/auth_service.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            onTap: () => goToUserScreen(context),
            title: const Text('U S E R'),
            leading: const Icon(Icons.person),
          ),
          ListTile(
            onTap: () {},
            title: const Text('S E T T I N G S'),
            leading: const Icon(Icons.settings),
          ),
          ListTile(
            onTap: () => FirebaseAuthService().logoutFromApp().whenComplete(
                  () => goToIntro(),
                ),
            title: const Text('L O G O U T'),
            leading: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }

  //navigate to intro page
  goToIntro() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const IntroScreen(),
      ),
    );
  }

  goToUserScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserScreen(),
      ),
    );
  }
}
