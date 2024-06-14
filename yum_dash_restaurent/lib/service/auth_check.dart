import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/intro%20screen/intro_data/into_data.dart';

import '../homepage/homepage.dart';

//check user authentication through streambuilder
class FirebaseAuthCheck extends StatelessWidget {
  const FirebaseAuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //if user found navigate to home screen            
          return const Homepage();
        } else {
          //if user not found navigate to intro screen
          return const IntroData();
        }
      },
    );
  }
}
