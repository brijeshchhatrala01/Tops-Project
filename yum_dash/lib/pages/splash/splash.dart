import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash/theme/theme.dart';

import '../../service/firebase_auth/authcheck.dart';

//splashscreen page
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //call splash method

    checkConnectivity();
    super.initState();
  }

  //go to auth checking
  void goToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuthCheck(),
      ),
    );
  }

  //display dailogue if network connection not available
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
            'Assets/smartphone.png',
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

  //check network connectivity
  Future checkConnectivity() async {
    var connection = await Connectivity().checkConnectivity();

    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      splashMethod();
    } else {
      showNetworkError();
    }
  }

  //navigate to diff. screen after 3 second
  void splashMethod() async {
    //after 3 second app screen navigate to login page
    Timer(const Duration(seconds: 3), () {
      goToAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeDataApp().getBackgroundColor(context),
      body: Center(
        child: Image.asset('assets/logo-color.png'),
      ),
    );
  }
}
