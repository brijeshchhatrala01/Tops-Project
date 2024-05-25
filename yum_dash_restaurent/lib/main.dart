import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/firebase_options.dart';

import 'intro screen/intro.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      //set theme according to device
      theme: MediaQuery.of(context).platformBrightness != Brightness.dark
          ? ThemeDataApp.ThemeDataLight()
          : ThemeDataApp.ThemeDataDark(),
    );
  }
}
