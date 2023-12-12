import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiperight/models/food_grocery_model.dart';
import 'package:swiperight/models/user_model.dart';
import 'package:swiperight/utils/tab_view_home.dart';
import 'package:swiperight/views/create_new_password.dart';
import 'package:swiperight/views/login_screen.dart';
import 'package:swiperight/views/welcome_page.dart';

class UserController extends ChangeNotifier {
  UserController() {
    checkSignedIn();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userConfirmPasswordController = TextEditingController();
  final registerKey = GlobalKey<FormState>();

//---------------------Custom Alert---------------------------------------------
  myCustomAlert(context, message, email, Function onTap) {
    CoolAlert.show(
        onConfirmBtnTap: () {
          onTap;
        },
        backgroundColor: Colors.blue,
        title: 'Verification',
        text: 'A verification link sent to $email. Verify email before login.',
        confirmBtnColor: Colors.blueAccent,
        context: context,
        type: CoolAlertType.info,
        widget: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text(message)],
          ),
        ),
        width: 300);
    notifyListeners();
  }

  //-----------------User---------------------------------------
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  Future<void> saveUser(
    String userid,
    String userName,
    String userEmail,
  ) async {
    _userModel = UserModel(
      userid: userid,
      userName: userName,
      userEmail: userEmail,
    );

    await firebaseFirestore
        .collection('users')
        .doc(userid)
        .set(_userModel!.toMap());

    notifyListeners();
  }

  Future<void> signupUser(
    String userName,
    String userEmail,
    String userPassword,
    context,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(
        userCredential.user!.uid,
        userName,
        userEmail,
      );
      myCustomAlert(context, '', userEmail, () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Pasword is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Email already used')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  //-----------------------------User Login-------------------------------------

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  Future<void> userLogin(String userEmail, String userPassword, context) async {
    try {
      print('tryingg.............');
      await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      print('Verification : $emailVerified');

      if (emailVerified == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please verify your email')));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const TabViewHome(),
            ),
            (route) => false);
        setSignIn();
        clearLoginFields();
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      // if (e.code == 'user-not-found') {
      //   print("1 $e");
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(content: Text('No user found')));
      // } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
      //   print('2 $e');
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(content: Text('No user found')));
      // } else if (e.code == 'wrong-password') {
      //   print('3 $e');
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(content: Text('Incorrect password')));
      // }
    } catch (e) {
      print('4 $e');
    }
    notifyListeners();
  }

  void clearLoginFields() {
    loginEmailController.clear();
    loginpasswordController.clear();
    notifyListeners();
  }

  //-----------------RESET PASSWORD---------------------------------------------
  TextEditingController passwordResetEmailController = TextEditingController();
  final resetPassEmailKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail(String email, context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Password reset email sent successfully. Check your inbox.')));

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CreateNewPasswordScreen(),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      print(e);
    }
  }

  //---------------------Shared Preferences-------------------------------------

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  void checkSignedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('is_signedIn') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', true);
    _isSignedIn = true;

    notifyListeners();
  }

  Future setSignOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', false);
    _isSignedIn = false;

    notifyListeners();
  }

  //------------------GET USER DATA---------------------------------------------

  String? _uid;
  String get uid => _uid!;

  Future fetchUserData() async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
            userid: snapshot['userid'],
            userName: snapshot['userName'],
            userEmail: snapshot['userEmail']);

        _uid = userModel.userid;
      });
    } catch (e) {
      print('User fetching failed : $e');
    }
  }

  //-------------------------Fetch Food Group-------------------------------------
  NewFoodGroup? _newFoodGroup;
  NewFoodGroup get newFoodGroup => _newFoodGroup!;

  List<NewFoodGroup> foodGroupList = [];
  NewFoodGroup? newGroup;

  Future<void> fetchFoodGroup() async {
    try {
      foodGroupList.clear();
      CollectionReference foodGroupRef =
          firebaseFirestore.collection('food group');
      QuerySnapshot foodGroupSnapshot = await foodGroupRef.get();

      for (var doc in foodGroupSnapshot.docs) {
        String groupName = doc['groupName'];

        newGroup = NewFoodGroup(groupName: groupName);
        foodGroupList.add(newGroup!);
      }
    } catch (e) {
      print('Food Group Fetching Failed : $e');
    }
    notifyListeners();
  }

  //------------------SPLASH SCREEN---------------------------------------------

  gotoNext(context) async {
    if (isSignedIn == true) {
      await Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TabViewHome(),
          ),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    }
    // notifyListeners();
  }
}
