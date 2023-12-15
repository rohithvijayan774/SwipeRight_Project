import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swiperight/models/user_model.dart';
import 'package:swiperight/views/admin/admin_bottom_nav_bar.dart';
import 'package:swiperight/views/admin/admin_home.dart';
import 'package:swiperight/views/admin/admin_users_list.dart';

class AdminController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();
  final adminLoginKey = GlobalKey<FormState>();
  String adminid = 'swiperight@123';
  String adminPassword = '123456';

  checkAdmin(context, String userName, String userPassword) {
    if (userName == adminid && userPassword == adminPassword) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AdminBottomNavBar(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
    }
  }

  //-----------------------Admin Bottom Nav Bar---------------------------------

  int currentIndex = 0;

  List<Widget> pages = [
    const AdminHome(),
    const AdminUsersList(),
  ];

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  int counter = 0;
  List<int> items = [];
  void increment() {
    counter++;
    items.add(counter);
    notifyListeners();
  }

  //-----------------fetch users -----------------------------------------------

  List<UserModel> usersList = [];
  UserModel? users;

  Future<void> fetchUsers() async {
    try {
      print('***********FETCHING USERS***');
      usersList.clear();
      CollectionReference userRef = firebaseFirestore.collection('users');
      QuerySnapshot userSnapshot = await userRef.get();

      for (var doc in userSnapshot.docs) {
        String userid = doc['userid'];
        String userName = doc['userName'];
        String userEmail = doc['userEmail'];

        users =
            UserModel(userid: userid, userName: userName, userEmail: userEmail);
        usersList.add(users!);
      }
    } catch (e) {
      print('Fetching users failed : $e');
    }
    // notifyListeners();
  }
}
