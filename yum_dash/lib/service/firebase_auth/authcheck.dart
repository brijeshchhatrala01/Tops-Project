// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash/pages/homepae/homepage.dart';

import '../../pages/login/login.dart';

//check if user exists or not
class FirebaseAuthCheck extends StatelessWidget {
  FirebaseAuthCheck({super.key});

  final _auth = FirebaseAuth.instance;

  //add user to database
  // Future<void> addUser() async {
  //   var url = 'https://gleg-span.000webhostapp.com/Zomato/User/add%20user.php';
  //   var resp = await http.post(Uri.parse(url), body: {
  //     'email': _auth.currentUser?.email ?? 'null',
  //     'phone': _auth.currentUser?.phoneNumber ?? 'null',
  //   });
  //   debugPrint(resp.statusCode.toString());
  // }

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
