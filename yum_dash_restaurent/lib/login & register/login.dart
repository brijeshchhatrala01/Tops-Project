// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:yum_dash_restaurent/service/auth_check.dart';
import 'package:yum_dash_restaurent/service/auth_service.dart';
import '../theme/colors.dart';

//login screen
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //go to authentication check user
  void goToAuthCheck() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FirebaseAuthCheck(),
      ),
    );
  }

  //key to validate form state
  final _key = GlobalKey<FormState>();

  //controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //get device height & width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
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
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 18),
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) => checkValidation(value),
                  cursorColor: lightGreen,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 18,
                    ),
                    hintText: "Enter An Email",
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  cursorColor: lightGreen,
                  style: const TextStyle(fontSize: 18),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) => checkValidation(value),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 18),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //login button
                GestureDetector(
                  //signin with google
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      FirebaseAuthService()
                          .signInWithEmailPassword(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          )
                          .whenComplete(
                            () => goToAuthCheck(),
                          );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(14),
                    child: const Center(
                      child: Text(
                        'L O G I N',
                        style: TextStyle(fontSize: 18, color: kWhiteColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),

                //google button
                GestureDetector(
                  //signin with google
                  onTap: () => FirebaseAuthService()
                      .signInWithGoogleAccount(context)
                      .whenComplete(
                        () => goToAuthCheck(),
                      ),
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

  //check form validation
  checkValidation(String? value) {
    return value!.isEmpty ? 'please enter required details' : null;
  }
}
