import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/widgets/profile_list_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height / 6,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: defaultPurpleColor,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'UserName',
                          style: TextStyle(fontFamily: 'Poppins'),
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
                          title: 'HISTORY',
                          tileIcon: Icons.document_scanner_outlined,
                          onPressed: () {}),
                      ProfileListTile(
                          title: 'PRIVACY',
                          tileIcon: Icons.privacy_tip_outlined,
                          onPressed: () {}),
                      ProfileListTile(
                          title: 'BANKS AND CARDS',
                          tileIcon: Icons.credit_card,
                          onPressed: () {}),
                      ProfileListTile(
                          title: 'CUSTOMER SERVICE',
                          tileIcon: Icons.supervised_user_circle_outlined,
                          onPressed: () {}),
                      ProfileListTile(
                          title: 'SETTINGS',
                          tileIcon: Icons.settings_outlined,
                          onPressed: () {}),
                      ProfileListTile(
                          title: 'ABOUT',
                          tileIcon: Icons.person_outline_rounded,
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
