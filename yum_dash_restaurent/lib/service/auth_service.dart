// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motion_toast/motion_toast.dart';

class FirebaseAuthService {
  //firebaseauth instace
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //googlesignin instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  //signin with google account
  Future<void> signInWithGoogleAccount(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        if (googleSignInAuthentication.accessToken != null) {
          AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          UserCredential userCredential =
              await _firebaseAuth.signInWithCredential(authCredential);
        }
      }
    } catch (e) {
      MotionToast.error(description: Text(e.toString()));
    }
  }

  //signin with phone number
  // Future<void> signInWithPhone(String mobile, BuildContext context) async {
  //   try {
  //     await _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: '+91$mobile',
  //       timeout: const Duration(seconds: 120),
  //       verificationCompleted: (phoneAuthCredential) {
  //         _firebaseAuth.signInWithCredential(phoneAuthCredential);
  //       },
  //       verificationFailed: (error) {
  //         MotionToast.error(description: Text(error.code));
  //       },
  //       codeSent: (verificationId, forceResendingToken) {
  //         //show dailogue to get user sms code
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => GetOTPScreen(
  //                 mobile: mobile,
  //                 verificationId: verificationId,
  //               ),
  //             ));
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {
  //         verificationId = verificationId;
  //       },
  //     );
  //   } catch (e) {
  //     MotionToast.error(
  //       description: Text(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

  //signin with email password
  Future signUpWithEmailPassword(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseException catch (e) {      
      MotionToast.error(description: Text(e.code));
    }
  }

  //login with email & passwords
  Future signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      MotionToast.error(
        description: Text(e.code),
      );
    }
  }

  //logout from app
  Future<void> logoutFromApp() async {
    _firebaseAuth.signOut();

    _googleSignIn.signOut();
  }
}
