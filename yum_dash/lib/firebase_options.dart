// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmD4kkHkc0a6zyG5fFrP-gH4rBjA9xlqM',
    appId: '1:599459219695:android:1e2cf55161799ec10f731a',
    messagingSenderId: '599459219695',
    projectId: 'yum-dash-app',
    storageBucket: 'yum-dash-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5RHlqMS6cwapc-gj3CWyBbXWxvTKimAo',
    appId: '1:599459219695:ios:da4de06251bd3a430f731a',
    messagingSenderId: '599459219695',
    projectId: 'yum-dash-app',
    storageBucket: 'yum-dash-app.appspot.com',
    androidClientId: '599459219695-tehnncku6q0iqpholg1lkjr29lkmf93p.apps.googleusercontent.com',
    iosClientId: '599459219695-shvtvbgmep40bmn2fa4sant5irjmfigg.apps.googleusercontent.com',
    iosBundleId: 'com.example.yumDash',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCuK4SKFMGZ0ES2jCeUQx-oPr_SE7Yv00k',
    appId: '1:599459219695:web:15dc09603091a1e50f731a',
    messagingSenderId: '599459219695',
    projectId: 'yum-dash-app',
    authDomain: 'yum-dash-app.firebaseapp.com',
    storageBucket: 'yum-dash-app.appspot.com',
  );

}