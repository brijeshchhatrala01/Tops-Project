// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/intro%20screen/intro_data/into_data.dart';
import 'package:yum_dash_restaurent/service/auth_check.dart';
import 'package:yum_dash_restaurent/theme/theme.dart';

//splashscreen page
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  //show network error dialogue
  Future<void> showNetworkError() async {
    return showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: const Text(
            textAlign: TextAlign.center,
            'Network Not Available!!!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Image.asset(
            'assets/network_error.png',
            width: width * 0.4,
            height: height * 0.4,
          ),
          actions: [
            ElevatedButton(
              onPressed: () => exit(0),
              child: const Text('E X I T'),
            )
          ],
        );
      },
    );
  }

  //navigate to auth checking screen after 3 seconds
  void goToAuthCheck() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FirebaseAuthCheck(),
          ));
    });
  }

  Future checkConnectivity() async {
    var connection = await Connectivity().checkConnectivity();

    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      // goToAuthCheck();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroData(),
          ));
    } else {
      showNetworkError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeDataApp().getBackgroundColor(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset('assets/logo-color.png'),
          ),
        ),
      ),
    );
  }
}
