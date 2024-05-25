// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../custom_widgets/custom_widgets.dart';
import '../../../service/auth_service.dart';
import '../../../service/firebase_auth/authcheck.dart';
import '../../../theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kGrey,
            toolbarHeight: 100,
            surfaceTintColor: kHomepageBG,
            pinned: true,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.person),
                ),
                const Column(
                  children: [
                    Text('Brijesh Chhatrala'),
                    Text(
                      'Gold Member',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              smallSizedBox,
              ListTile(
                onTap: () => MotionToast.success(
                  title: const Text('MT'),
                  description: const Text('Motion Toast'),
                ).show(context),
                leading: const CircleAvatar(
                  backgroundColor: kGrey,
                  child: Icon(Icons.person),
                ),
                title: const Text('Your Profile'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              smallSizedBox,
              ListTile(
                onTap: () => FirebaseAuthService()
                    .logoutFromApp()
                    .whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirebaseAuthCheck(),
                        ))),
                leading: const CircleAvatar(
                  backgroundColor: kGrey,
                  child: Icon(Icons.star_border),
                ),
                title: const Text('Logout'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ])),
          )
        ],
      )),
    );
  }
}
