// ignore_for_file: must_be_immutable, unused_field, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../service/firebase_auth/authcheck.dart';

class GetOTP extends StatelessWidget {
  String mobile;
  String verificationId;
  GetOTP({super.key, required this.mobile, required this.verificationId});

  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCodeTextField(
                controller: _otpController,
                animationCurve: Easing.legacy,
                keyboardType: TextInputType.number,
                appContext: context,
                obscureText: false,
                validator: (value) {
                  return value!.length != 6 ? 'please enter otp' : null;
                },
                onChanged: (value) {},
                onCompleted: (value) {},
                onEditingComplete: () {},
                onSubmitted: (value) {},
                length: 6,
                pinTheme: PinTheme(
                  activeColor: Theme.of(context).primaryColorLight,
                  activeFillColor: Theme.of(context).primaryColorDark,
                  inactiveColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).primaryColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    mobileSignIn(context);
                  }
                },
                child: const Text('S U B M I T'),
              )
            ],
          ),
        ),
      ),
    );
  }

  mobileSignIn(BuildContext context) {
    var smsCode = _otpController.text.trim();
    final _auth = FirebaseAuth.instance;
    final _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    _auth
        .signInWithCredential(_credential)
        .whenComplete(() => goToAuthCheck(context));
  }

  goToAuthCheck(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuthCheck(),
      ),
    );
  }
}
