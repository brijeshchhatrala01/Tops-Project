// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motion_toast/motion_toast.dart';

import '../pages/login/get_otp/get_otp.dart';

class FirebaseAuthService {
  //Firebaseauth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Googlesignin Object
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> signInWithPhone(String mobile, BuildContext context) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91$mobile',
        timeout: const Duration(seconds: 120),
        verificationCompleted: (phoneAuthCredential) {
          _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          MotionToast.error(description: Text(error.code));
        },
        codeSent: (verificationId, forceResendingToken) {
          //show dailogue to get user sms code
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetOTP(
                  mobile: mobile,
                  verificationId: verificationId,
                ),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationId = verificationId;
        },
      );
    } catch (e) {
      MotionToast.error(
        description: Text(
          e.toString(),
        ),
      );
    }
  }

  //logout
  Future<void> logoutFromApp() async {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}
