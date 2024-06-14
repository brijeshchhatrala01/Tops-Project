import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/firebase_options.dart';
import 'package:yum_dash_restaurent/service/auth_check.dart';
import 'package:yum_dash_restaurent/theme/theme.dart';

//main function
void main() async {

  //initialize flutter app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirebaseAuthCheck(),
      //set theme according to device
      theme: ThemeDataApp.getTheme(context),
    );
  }
}
