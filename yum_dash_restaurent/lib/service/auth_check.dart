import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/intro%20screen/intro_data/into_data.dart';

import '../homepage/homepage.dart';


class FirebaseAuthCheck extends StatelessWidget {
  const FirebaseAuthCheck({super.key});


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
        //  addUser();
          return const Homepage();
        } else {
          return const IntroData();
        }
      },
    );
  }
}
