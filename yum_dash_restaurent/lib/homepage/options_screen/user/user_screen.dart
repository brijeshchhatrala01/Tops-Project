import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //firebase auth instance;
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                _firebaseAuth.currentUser!.photoURL ??
                    'https://w7.pngwing.com/pngs/451/372/png-transparent-computer-icons-blog-person-aim-miscellaneous-grass-internet-thumbnail.png',
                width: deviceWidth * 0.2,
                height: deviceHeight * 0.2,
              ),
            ),
            UserDetails(
              userData: _firebaseAuth.currentUser!.displayName ?? 'Uusername',
            ),
            UserDetails(
              userData: _firebaseAuth.currentUser!.email ?? 'No Email Added',
            ),
            UserDetails(
              userData: _firebaseAuth.currentUser!.phoneNumber ??
                  'No Phone Number Added',
            ),
            UserDetails(
              userData: _firebaseAuth.currentUser!.emailVerified
                  ? 'Email Verified'
                  : 'Email Not Verifid',
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final String userData;
  const UserDetails({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            userData,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
