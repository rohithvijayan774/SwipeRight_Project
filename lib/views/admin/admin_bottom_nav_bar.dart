import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/admin_controller.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminController>(
      builder: (context, adminBottomNavController, _) {
        return Scaffold(
          body: adminBottomNavController
              .pages[adminBottomNavController.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: defaultBgColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.element_equal), label: 'Dashboard'),
              BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Users'),
            ],
            currentIndex: adminBottomNavController.currentIndex,
            onTap: (index) {
              adminBottomNavController.updateIndex(index);
            },
          ),
        );
      },
    );
  }
}
