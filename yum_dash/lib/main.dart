import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash/firebase_options.dart';

import 'pages/splash/splash.dart';
import 'theme/theme.dart';

//main method
void main() async {

  // intialize firebase
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
      //set theme according to device
      theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? ThemeDataApp.ThemeDataDark()
          : ThemeDataApp.ThemeDataLight(),
      home: const SplashScreen(),
    );
  }
}
