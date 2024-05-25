import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../service/firebase_auth/authcheck.dart';
import '../../theme/colors.dart';
import '../homepae/homepage.dart';

//login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void goToAuthCheck() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuthCheck(),
      ),
    );
  }

  //moble number controller
  final _mobileNumberController = TextEditingController();

  //initial country code
  String _initialSelectedCountryCode = "+91";

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //get device height & width
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kblackSplash
          : kWhiteColor,
      body: SafeArea(
        child: Form(
          key: _key,
          child: Column(
            children: [
              //header image
              Image.asset(
                'assets/logo-color.png',
                width: displayWidth,
                height: displayHeight / 2.3,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "India's #1 Food Delivery \n App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(
                          width: 10,
                        ),
                        Center(child: Text("Log in or sign up")),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 8),
                    //get user's mobile number with country code
                    SizedBox(
                      width: displayWidth * 0.9,
                      child: TextFormField(
                        controller: _mobileNumberController,
                        style: const TextStyle(fontSize: 18),
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (value) => checkValidation(value),
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 18),
                            prefixIcon: CountryCodePicker(
                              dialogBackgroundColor: kGrey,
                              initialSelection: _initialSelectedCountryCode,
                              onChanged: (value) {
                                _initialSelectedCountryCode = value.toString();
                              },
                            ),
                            hintText: "Enter Phone Number",
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!))),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Homepage(),
                              ));
                          // FirebaseAuthService().signInWithPhone(
                          //   _mobileNumberController.text.trim(),
                          //   context,
                          // );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(color: kWhiteColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(
                          width: 10,
                        ),
                        Center(child: Text("or")),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // FirebaseAuthService()
                            //   .signInWithGoogleAccount(context)
                            //   .whenComplete(() => goToAuthCheck());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kGrey),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: kWhiteColor,
                                backgroundImage:
                                    AssetImage('assets/ic_google.png'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kGrey),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: kGrey,
                              child: Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By Continuing, you agree to our',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Terms of Service Privacy Policy Content Policy',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  checkValidation(String? value) {
    return value!.isEmpty
        ? 'please enter mobile number'
        : value.length != 10
            ? 'please enter valid mobile number'
            : null;
  }
}
