// ignore_for_file: unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_dash/firebase_options.dart';
import 'package:yum_dash/service/firebase_auth/authcheck.dart';

import 'pages/splash/splash.dart';
import 'theme/theme.dart';

//main method
void main() async {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//the route configuration
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'authcheck',
          builder: (context, state) => FirebaseAuthCheck(),
        ),
      ],
    ),
  ],
);

//root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //set theme according to device
      theme: ThemeDataApp.getTheme(context),
      home: const SplashScreen(),
    );
  }
}
