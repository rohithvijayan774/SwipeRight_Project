import 'package:flutter/material.dart';
import 'package:swiperight/views/admin/admin_home.dart';

class AdminController extends ChangeNotifier {
  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();
  final adminLoginKey = GlobalKey<FormState>();
  String adminid = 'swiperight@123';
  String adminPassword = '123456';

  checkAdmin(context, String userName, String userPassword) {
    if (userName == adminid && userPassword == adminPassword) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AdminHome(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')));
    }
  }
}
