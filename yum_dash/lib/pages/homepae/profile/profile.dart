// ignore_for_file: unused_local_variable, non_constant_identifier_names, use_build_context_synchronously
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../custom_widgets/custom_widgets.dart';
import '../../../service/auth_service.dart';
import '../../../service/firebase_auth/authcheck.dart';
import '../../../theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

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
                GestureDetector(
                  onTap: () => pickImage(),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: getUserProfileImage(),
                      ),
                      const Positioned(
                          bottom: 4,
                          right: 0,
                          child: Icon(Icons.add,color: kWhiteColor,),
                      )
                    ],
                  ),
                ),
                 Column(
                  children: [
                    Text('${user!.displayName}'),
                    const Text(
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

  ImageProvider getUserProfileImage() {
    var user = FirebaseAuth.instance.currentUser;
    if(user!.photoURL!.isEmpty) {
      return const AssetImage('assets/user.png');
    }
    else {
      return NetworkImage(user.photoURL!);
    }
  }

  pickImage() async {
    final picker = ImagePicker();
    final picked_file = await picker.pickImage(source: ImageSource.gallery);
    if(picked_file != null) {
      showUpdateProfileDailogue(picked_file.path);
    }
  }

  Future<void> showUpdateProfileDailogue(String imagepath) async {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Update Profile picture'),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Cancle')),
          ElevatedButton(onPressed: () {
            updateProfilePicture(imagepath);
          }, child: const Text('Update'))
        ],
      );
    },);
  }

  updateProfilePicture(String imagePath) async {
    var connection = await Connectivity().checkConnectivity();

    if(connection == ConnectivityResult.mobile || connection == ConnectivityResult.wifi) {
      File image = File(imagePath);
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference reference = storage.ref().child(user!.uid);
        UploadTask uploadTask = reference.putFile(image);
        var imageUrl = '';
        uploadTask.then((res)async {
          if(res.state == TaskState.success)  {
            imageUrl = await res.ref.getDownloadURL();
            user!.updatePhotoURL(imageUrl);
            Navigator.pop(context);
          }
        },);
    }
  }
}
