// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/homepage.dart';

import '../../pages/login/login.dart';

//check if user exists or not
class FirebaseAuthCheck extends StatelessWidget {
  FirebaseAuthCheck({super.key});

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //addUser();
          return const Homepage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
