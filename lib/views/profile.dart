import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/food%20&%20groceries/settings.dart';
import 'package:swiperight/widgets/profile_list_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileController =
        Provider.of<UserController>(context, listen: false);
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child: FutureBuilder(
            future: profileController.fetchUserData(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: height / 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: defaultPurpleColor,
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      profileController.userModel.userName,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ProfileListTile(
                                      title: 'PRIVACY',
                                      tileIcon: Icons.privacy_tip_outlined,
                                      onPressed: () {}),
                                  ProfileListTile(
                                      title: 'CUSTOMER SERVICE',
                                      tileIcon:
                                          Icons.supervised_user_circle_outlined,
                                      onPressed: () {}),
                                  ProfileListTile(
                                    title: 'SETTINGS',
                                    tileIcon: Icons.settings_outlined,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Settings(),
                                        ),
                                      );
                                    },
                                  ),
                                  ProfileListTile(
                                    title: 'ABOUT',
                                    tileIcon: Icons.person_outline_rounded,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
