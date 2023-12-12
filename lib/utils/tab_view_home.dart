import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/home_screen.dart';
import 'package:swiperight/views/profile.dart';

class TabViewHome extends StatelessWidget {
  const TabViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const TabBarView(
          children: [
            HomeScreen(),
            Profile(),
          ],
        ),
        bottomNavigationBar: Container(
          color: defaultBgColor,
          child: const TabBar(
            overlayColor: MaterialStatePropertyAll(defaultBgColor),
            tabs: [
              Tab(
                child: Icon(Icons.home_filled),
              ),
              Tab(
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
