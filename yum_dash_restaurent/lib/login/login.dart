import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/service/auth_check.dart';
import 'package:yum_dash_restaurent/service/auth_service.dart';

import '../homepage/homepage.dart';
import '../theme/colors.dart';

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
        builder: (context) => const FirebaseAuthCheck(),
      ),
    );
  }

  final _mobileController = TextEditingController();

  //initial country code
  String _initialSelectedCountryCode = "+91";

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                const Center(
                  child: Text(
                    'Yum Dash',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Text('Restaurent Partner'),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Enter your phone number and we will send\n an OTP To continue',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: width * 0.84,
                  child: TextFormField(
                    controller: _mobileController,
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
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey[300]!)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey[300]!)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey[300]!))),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      // FirebaseAuthService()
                      //   .signInWithPhone(_mobileController.text, context);
                      goToHomepage(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(14),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'S E N D  O T P',
                        style: TextStyle(fontSize: 18, color: kWhiteColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        'OR',
                        style: TextStyle(color: kGrey, fontSize: 18),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () => FirebaseAuthService()
                      .signInWithGoogleAccount(context)
                      .whenComplete(() => goToAuthCheck()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          width: 32,
                          height: 32,
                        ),
                        const Text(
                          'Login with Google',
                          style: TextStyle(fontSize: 18, color: kWhiteColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToHomepage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ));
  }

  checkValidation(String? value) {
    return value!.isEmpty
        ? 'please enter mobile number'
        : value.length != 10
            ? 'please enter valid mobile number'
            : null;
  }
}
