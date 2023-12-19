import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiperight/models/dth_recharge_model.dart';
import 'package:swiperight/models/electricity_bill_model.dart';
import 'package:swiperight/models/food_grocery_model.dart';
import 'package:swiperight/models/insurance_model.dart';
import 'package:swiperight/models/loan_model.dart';
import 'package:swiperight/models/medcine_model.dart';
import 'package:swiperight/models/mobile_recharge_model.dart';
import 'package:swiperight/models/user_model.dart';
import 'package:swiperight/models/water_bill_model.dart';
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

  Future googleLogin(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      print("Google Credentials : $credential");
      print('name : ${googleUser.displayName}');
      print('name : ${googleUser.email}');
      print('name : ${googleUser.id}');
      print('name : ${googleUser.photoUrl}');
      return await firebaseAuth
          .signInWithCredential(credential)
          .then((value) => saveUser(firebaseAuth.currentUser!.uid,
              googleUser.displayName!, googleUser.email))
          .then((value) => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const TabViewHome(),
              ),
              (route) => false));
    } catch (e) {
      print(e);
    }
  }

  void clearLoginFields() {
    loginEmailController.clear();
    loginpasswordController.clear();
    notifyListeners();
  }

  void signOut(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // content: Text("Do you want to SignOut?"),
          title: const Text(
            'Do you want to SignOut?',
            style:
                TextStyle(fontFamily: 'SofiaPro', fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 17, fontFamily: "SofiaPro"),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                setSignOut();
                // _isSignedIn = false;
                // await clearLocalData();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx1) => const WelcomePage(),
                    ),
                    (route) => false);
              },
              child: const Text(
                'SignOut',
                style: TextStyle(
                    fontSize: 17, color: Colors.red, fontFamily: "SofiaPro"),
              ),
            ),
          ],
        );
      },
    );
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
    print('Checking Signin : $_isSignedIn');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('is_signedIn') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    print('******calling setSigned in');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('is_signedIn', true);
    _isSignedIn = true;

    print("Is Signed in Home : $_isSignedIn");

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

  //-------------------------Fetch Food Group-----------------------------------
  var currentItem = 'ALL ITEMS';
  changeCurrentItem(String newValue) {
    currentItem = newValue;
    notifyListeners();
  }

  NewFoodGroup? _newFoodGroup;
  NewFoodGroup get newFoodGroup => _newFoodGroup!;

  List<NewFoodGroup> foodGroupList = [];
  NewFoodGroup? newGroup;

  Future<void> fetchFoodGroup() async {
    try {
      foodGroupList.clear();
      CollectionReference foodGroupRef =
          firebaseFirestore.collection('foodGroup');
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
    print("isSignedin :  $isSignedIn");
    if (isSignedIn == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TabViewHome(),
          ),
          (route) => false);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
          (route) => false);
    }
    // notifyListeners();
  }

  //----------------------ADD FOOD&GROCERY--------------------------------------

  FoodGroceryModel? _foodGroceryModel;
  FoodGroceryModel get foodGroceryModel => _foodGroceryModel!;

  Future<void> storeFoodGrocery(
      String foodGroceryid,
      String foodGroceryName,
      String foodGroceryExpiryDate,
      String foodGroceryReminder,
      String foodGroceryGroup,
      String foodGroceryNote,
      String expiryDate) async {
    try {
      _foodGroceryModel = FoodGroceryModel(
          foodGroceryid: foodGroceryid,
          foodGroceryName: foodGroceryName,
          foodGroceryExpiryDate: foodGroceryExpiryDate,
          foodGroceryReminder: foodGroceryReminder,
          foodGroceryGroup: foodGroceryGroup,
          foodGroceryNote: foodGroceryNote,
          expiryDate: expiryDate);

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('food&grocery')
          .doc(foodGroceryid)
          .set(_foodGroceryModel!.toMap());
      notifyListeners();
    } catch (e) {
      print('Storing food & grocery failed : $e');
    }
  }

  //--------------------------------FETCH FOOD&GROCERY--------------------------

  String? _foodGroceryid;
  String get foodGroceryid => _foodGroceryid!;

  List<FoodGroceryModel> foodGroceryList = [];
  FoodGroceryModel? foodGroceries;

  Future filterItems(String item) async {
    try {
      print('*********Filtering with $item***********************');
      foodGroceryList.clear();
      CollectionReference foodGroceryRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('food&grocery');
      QuerySnapshot foodGrocerySnapshot =
          await foodGroceryRef.where('foodGroceryGroup', isEqualTo: item).get();

      for (var doc in foodGrocerySnapshot.docs) {
        String foodGroceryid = doc['foodGroceryid'];
        String foodGroceryName = doc['foodGroceryName'];
        String foodGroceryExpiryDate = doc['foodGroceryExpiryDate'];
        String foodGroceryReminder = doc['foodGroceryReminder'];
        String foodGroceryGroup = doc['foodGroceryGroup'];
        String foodGroceryNote = doc['foodGroceryNote'];
        String expiryDate = doc['expiryDate'];

        foodGroceries = FoodGroceryModel(
          foodGroceryid: foodGroceryid,
          foodGroceryName: foodGroceryName,
          foodGroceryExpiryDate: foodGroceryExpiryDate,
          foodGroceryReminder: foodGroceryReminder,
          foodGroceryGroup: foodGroceryGroup,
          foodGroceryNote: foodGroceryNote,
          expiryDate: expiryDate,
        );
        foodGroceryList.add(foodGroceries!);
      }
    } catch (e) {
      print('FoodGrocery Fetch Failed : $e');
    }
  }

  Future fetchFoodGrocery() async {
    try {
      print('*********Fetching FoodGroceries***********************');
      foodGroceryList.clear();
      CollectionReference foodGroceryRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('food&grocery');
      QuerySnapshot foodGrocerySnapshot = await foodGroceryRef.get();

      for (var doc in foodGrocerySnapshot.docs) {
        String foodGroceryid = doc['foodGroceryid'];
        String foodGroceryName = doc['foodGroceryName'];
        String foodGroceryExpiryDate = doc['foodGroceryExpiryDate'];
        String foodGroceryReminder = doc['foodGroceryReminder'];
        String foodGroceryGroup = doc['foodGroceryGroup'];
        String foodGroceryNote = doc['foodGroceryNote'];
        String expiryDate = doc['expiryDate'];

        foodGroceries = FoodGroceryModel(
          foodGroceryid: foodGroceryid,
          foodGroceryName: foodGroceryName,
          foodGroceryExpiryDate: foodGroceryExpiryDate,
          foodGroceryReminder: foodGroceryReminder,
          foodGroceryGroup: foodGroceryGroup,
          foodGroceryNote: foodGroceryNote,
          expiryDate: expiryDate,
        );
        foodGroceryList.add(foodGroceries!);
      }
    } catch (e) {
      print('FoodGrocery Fetch Failed : $e');
    }
  }

  Future fetchFoodGrocerySoonExpire() async {
    try {
      print(
          '*********Fetching FoodGroceries Soon Expire***********************');
      foodGroceryList.clear();

      CollectionReference foodGroceryRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('food&grocery');

      QuerySnapshot foodGrocerySnapshot = await foodGroceryRef.get();

      DateTime currentDate = DateTime.now();

      for (var doc in foodGrocerySnapshot.docs) {
        String foodGroceryid = doc['foodGroceryid'];
        String foodGroceryName = doc['foodGroceryName'];
        String foodGroceryExpiryDate = doc['foodGroceryExpiryDate'];
        String foodGroceryReminder = doc['foodGroceryReminder'];
        String foodGroceryGroup = doc['foodGroceryGroup'];
        String foodGroceryNote = doc['foodGroceryNote'];
        String expiryDate = doc['expiryDate'];

        DateTime expirationDateTime = DateTime.parse(expiryDate);
        int daysUntilExpiration =
            expirationDateTime.difference(currentDate).inDays;

        print('Days Unitl Expiry :$daysUntilExpiration');

        if (daysUntilExpiration <= 5 && daysUntilExpiration >= 0) {
          foodGroceries = FoodGroceryModel(
            foodGroceryid: foodGroceryid,
            foodGroceryName: foodGroceryName,
            foodGroceryExpiryDate: foodGroceryExpiryDate,
            foodGroceryReminder: foodGroceryReminder,
            foodGroceryGroup: foodGroceryGroup,
            foodGroceryNote: foodGroceryNote,
            expiryDate: expiryDate,
          );
          foodGroceryList.add(foodGroceries!);
        }
      }
    } catch (e) {
      print('FoodGrocery Fetch Failed : $e');
    }
  }

  Future fetchFoodGroceryExpired() async {
    try {
      print(
          '*********Fetching FoodGroceries Soon Expire***********************');
      foodGroceryList.clear();

      CollectionReference foodGroceryRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('food&grocery');

      QuerySnapshot foodGrocerySnapshot = await foodGroceryRef.get();

      DateTime currentDate = DateTime.now();

      for (var doc in foodGrocerySnapshot.docs) {
        String foodGroceryid = doc['foodGroceryid'];
        String foodGroceryName = doc['foodGroceryName'];
        String foodGroceryExpiryDate = doc['foodGroceryExpiryDate'];
        String foodGroceryReminder = doc['foodGroceryReminder'];
        String foodGroceryGroup = doc['foodGroceryGroup'];
        String foodGroceryNote = doc['foodGroceryNote'];
        String expiryDate = doc['expiryDate'];

        DateTime expirationDateTime = DateTime.parse(expiryDate);
        int daysUntilExpiration =
            expirationDateTime.difference(currentDate).inDays;

        print('Days Unitl Expiry :$daysUntilExpiration');

        if (daysUntilExpiration < 0) {
          foodGroceries = FoodGroceryModel(
            foodGroceryid: foodGroceryid,
            foodGroceryName: foodGroceryName,
            foodGroceryExpiryDate: foodGroceryExpiryDate,
            foodGroceryReminder: foodGroceryReminder,
            foodGroceryGroup: foodGroceryGroup,
            foodGroceryNote: foodGroceryNote,
            expiryDate: expiryDate,
          );
          foodGroceryList.add(foodGroceries!);
        }
      }
    } catch (e) {
      print('FoodGrocery Fetch Failed : $e');
    }
  }

  //----------------------------ADD FETCH MEDICINE------------------------------

  NewMedicineGroup? _newMedicineGroup;
  NewMedicineGroup get newMedicineGroup => _newMedicineGroup!;

  List<NewMedicineGroup> medicineGroupList = [];
  NewMedicineGroup? newMedGroup;

  Future<void> fetchMedicineGroup() async {
    try {
      medicineGroupList.clear();
      CollectionReference medicineGroupRef =
          firebaseFirestore.collection('medicineGroup');
      QuerySnapshot foodGroupSnapshot = await medicineGroupRef.get();

      for (var doc in foodGroupSnapshot.docs) {
        String groupName = doc['groupName'];

        newMedGroup = NewMedicineGroup(groupName: groupName);
        medicineGroupList.add(newMedGroup!);
      }
    } catch (e) {
      print('Food Group Fetching Failed : $e');
    }
    notifyListeners();
  }

  MedicineModel? _medicineModel;
  MedicineModel get medicineModel => _medicineModel!;

  Future<void> storeMedicine(
      String medicineid,
      String medicineName,
      String medicineExpiryDate,
      String medicineReminder,
      String medicineGroup,
      String medicineNote,
      String expiryDate) async {
    try {
      _medicineModel = MedicineModel(
          medicineid: medicineid,
          medicineName: medicineName,
          medicineExpiryDate: medicineExpiryDate,
          medicineReminder: medicineReminder,
          medicineGroup: medicineGroup,
          medicineNote: medicineNote,
          expiryDate: expiryDate);

      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('medicines')
          .doc(medicineid)
          .set(_medicineModel!.toMap());
      notifyListeners();
    } catch (e) {
      print('Storing food & grocery failed : $e');
    }
  }

  String? _medicineid;
  String get medicineid => _medicineid!;

  List<MedicineModel> medicinesList = [];
  MedicineModel? medicines;

  Future fetchAllMedicines() async {
    try {
      print('*********Fetching Medicines***********************');
      medicinesList.clear();
      CollectionReference medicinesRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('medicines');
      QuerySnapshot medicinesSnapshot = await medicinesRef.get();

      for (var doc in medicinesSnapshot.docs) {
        String medicineid = doc['medicineid'];
        String medicineName = doc['medicineName'];
        String medicineExpiryDate = doc['medicineExpiryDate'];
        String medicineReminder = doc['medicineReminder'];
        String medicineGroup = doc['medicineGroup'];
        String medicineNote = doc['medicineNote'];
        String expiryDate = doc['expiryDate'];

        medicines = MedicineModel(
            medicineid: medicineid,
            medicineName: medicineName,
            medicineExpiryDate: medicineExpiryDate,
            medicineReminder: medicineReminder,
            medicineGroup: medicineGroup,
            medicineNote: medicineNote,
            expiryDate: expiryDate);
        medicinesList.add(medicines!);
      }
    } catch (e) {
      print('Medicine Fetch Failed : $e');
    }
  }

  Future fetchMedicinesSoonExpire() async {
    try {
      print('*********Fetching Medicines***********************');
      medicinesList.clear();
      CollectionReference medicinesRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('medicines');
      QuerySnapshot medicinesSnapshot = await medicinesRef.get();

      DateTime currentDate = DateTime.now();

      for (var doc in medicinesSnapshot.docs) {
        String medicineid = doc['medicineid'];
        String medicineName = doc['medicineName'];
        String medicineExpiryDate = doc['medicineExpiryDate'];
        String medicineReminder = doc['medicineReminder'];
        String medicineGroup = doc['medicineGroup'];
        String medicineNote = doc['medicineNote'];
        String expiryDate = doc['expiryDate'];

        DateTime expirationDateTime = DateTime.parse(expiryDate);
        int daysUntilExpiration =
            expirationDateTime.difference(currentDate).inDays;

        if (daysUntilExpiration <= 5 && daysUntilExpiration >= 0) {
          medicines = MedicineModel(
              medicineid: medicineid,
              medicineName: medicineName,
              medicineExpiryDate: medicineExpiryDate,
              medicineReminder: medicineReminder,
              medicineGroup: medicineGroup,
              medicineNote: medicineNote,
              expiryDate: expiryDate);
          medicinesList.add(medicines!);
        }
      }
    } catch (e) {
      print('Medicine Fetch Failed : $e');
    }
  }

  Future fetchMedicinesExpired() async {
    try {
      print('*********Fetching Medicines***********************');
      medicinesList.clear();
      CollectionReference medicinesRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('medicines');
      QuerySnapshot medicinesSnapshot = await medicinesRef.get();

      DateTime currentDate = DateTime.now();

      for (var doc in medicinesSnapshot.docs) {
        String medicineid = doc['medicineid'];
        String medicineName = doc['medicineName'];
        String medicineExpiryDate = doc['medicineExpiryDate'];
        String medicineReminder = doc['medicineReminder'];
        String medicineGroup = doc['medicineGroup'];
        String medicineNote = doc['medicineNote'];
        String expiryDate = doc['expiryDate'];

        DateTime expirationDateTime = DateTime.parse(expiryDate);
        int daysUntilExpiration =
            expirationDateTime.difference(currentDate).inDays;

        if (daysUntilExpiration < 0) {
          medicines = MedicineModel(
              medicineid: medicineid,
              medicineName: medicineName,
              medicineExpiryDate: medicineExpiryDate,
              medicineReminder: medicineReminder,
              medicineGroup: medicineGroup,
              medicineNote: medicineNote,
              expiryDate: expiryDate);
          medicinesList.add(medicines!);
        }
      }
    } catch (e) {
      print('Medicine Fetch Failed : $e');
    }
  }

  //-----------------------ADD&FETCH ELECTRICITY BILLS--------------------------

  ElectricityBillModel? _electricityBillModel;
  ElectricityBillModel get electricityBillModel => _electricityBillModel!;
  TextEditingController elecConsumerNumberController = TextEditingController();
  TextEditingController elecCustomerNameController = TextEditingController();
  TextEditingController elecBillAmountController = TextEditingController();
  TextEditingController elecBillDateController = TextEditingController();
  TextEditingController elecDueDateController = TextEditingController();
  TextEditingController elecRemiderDateController = TextEditingController();
  final elecBillFormKey = GlobalKey<FormState>();

  Future<void> storeElectricityBill(
      int consumerNumber,
      String customerName,
      int billAmount,
      String billDate,
      String dueDate,
      String reminderDate,
      String electricityBoard,
      bool billStatus) async {
    try {
      _electricityBillModel = ElectricityBillModel(
          consumerNumber: consumerNumber,
          customerName: customerName,
          billAmount: billAmount,
          billDate: billDate,
          dueDate: dueDate,
          reminderDate: reminderDate,
          electricityBoard: electricityBoard,
          billStatus: billStatus);

      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('electricityBill').doc();
      docs.set(_electricityBillModel!.toMap(docs.id));
    } catch (e) {
      print(e);
    }
  }

  List<ElectricityBillModel> elecBillsList = [];
  ElectricityBillModel? elecBills;

  Future fetchElecBills(electricityBoard) async {
    try {
      elecBillsList.clear();
      CollectionReference elecBillRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('electricityBill');
      QuerySnapshot elecBillSnapshot = await elecBillRef
          .where('electricityBoard', isEqualTo: electricityBoard)
          .get();

      for (var doc in elecBillSnapshot.docs) {
        String billid = doc['billid'];
        int consumerNumber = doc['consumerNumber'];
        String customerName = doc['customerName'];
        int billAmount = doc['billAmount'];
        String billDate = doc['billDate'];
        String dueDate = doc['dueDate'];
        String reminderDate = doc['reminderDate'];
        String electricityBoard = doc['electricityBoard'];
        bool billStatus = doc['billStatus'];

        elecBills = ElectricityBillModel(
            billid: billid,
            consumerNumber: consumerNumber,
            customerName: customerName,
            billAmount: billAmount,
            billDate: billDate,
            dueDate: dueDate,
            reminderDate: reminderDate,
            electricityBoard: electricityBoard,
            billStatus: billStatus);
        elecBillsList.add(elecBills!);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateBillStatus(
    String collectionName,
    String billid,
    bool newValue,
  ) async {
    try {
      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection(collectionName)
          .doc(billid);
      await docRef.update({'billStatus': newValue});
    } catch (e) {
      print('update failed : $e');
    }
  }

  DateTime? selectedFormattedDate;

  Future<void> selectDate(
      context, selectedDate, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  //-----------------------ADD&FETCH WATER BILLS--------------------------------

  WaterBillModel? _waterBillModel;
  WaterBillModel get waterBillModel => _waterBillModel!;
  TextEditingController waterConnectionidController = TextEditingController();
  TextEditingController waterCustomerNameController = TextEditingController();
  TextEditingController waterBillAmountController = TextEditingController();
  TextEditingController waterBillDateController = TextEditingController();
  TextEditingController waterDueDateController = TextEditingController();
  TextEditingController waterRemiderDateController = TextEditingController();
  final waterBillKey = GlobalKey<FormState>();

  Future<void> storeWaterBill(
      int connectionid,
      String customerName,
      int billAmount,
      String billDate,
      String dueDate,
      String reminderDate,
      String authority,
      bool billStatus) async {
    try {
      _waterBillModel = WaterBillModel(
          connectionid: connectionid,
          customerName: customerName,
          billAmount: billAmount,
          billDate: billDate,
          dueDate: dueDate,
          reminderDate: reminderDate,
          authority: authority,
          billStatus: billStatus);

      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('waterBill').doc();
      docs.set(_waterBillModel!.toMap(docs.id));
    } catch (e) {
      print(e);
    }
  }

  List<WaterBillModel> waterBillsList = [];
  WaterBillModel? waterBills;

  Future fetchWaterBills(authority) async {
    try {
      waterBillsList.clear();
      CollectionReference waterBillRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('waterBill');
      QuerySnapshot waterBillSnapshot =
          await waterBillRef.where('authority', isEqualTo: authority).get();

      for (var doc in waterBillSnapshot.docs) {
        String billid = doc['billid'];
        int connectionid = doc['connectionid'];
        String customerName = doc['customerName'];
        int billAmount = doc['billAmount'];
        String billDate = doc['billDate'];
        String dueDate = doc['dueDate'];
        String reminderDate = doc['reminderDate'];
        String authority = doc['authority'];
        bool billStatus = doc['billStatus'];

        waterBills = WaterBillModel(
            billid: billid,
            connectionid: connectionid,
            customerName: customerName,
            billAmount: billAmount,
            billDate: billDate,
            dueDate: dueDate,
            reminderDate: reminderDate,
            authority: authority,
            billStatus: billStatus);
        waterBillsList.add(waterBills!);
      }
    } catch (e) {
      print(e);
    }
  }
  //-----------------------ADD&FETCH LOANS--------------------------------------

  LoanModel? _loanModel;
  LoanModel get loanModel => _loanModel!;
  TextEditingController loanAccountNumberController = TextEditingController();
  TextEditingController loanCustomerNameController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController loanreminderDateController = TextEditingController();
  TextEditingController loanDueDateController = TextEditingController();
  TextEditingController loanMobileNumberController = TextEditingController();
  final loanAddKey = GlobalKey<FormState>();

  Future<void> storeLoan(
      int loanAccountNumber,
      String customerName,
      int loanAmount,
      int mobileNumber,
      String dueDate,
      String reminderDate,
      String bank,
      bool loanStatus) async {
    try {
      _loanModel = LoanModel(
          loanAccountNumber: loanAccountNumber,
          customerName: customerName,
          loanAmount: loanAmount,
          mobileNumber: mobileNumber,
          dueDate: dueDate,
          reminderDate: reminderDate,
          bank: bank,
          loanStatus: loanStatus);

      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('loans').doc();
      docs.set(_loanModel!.toMap(docs.id));
    } catch (e) {
      print(e);
    }
  }

  List<LoanModel> loanList = [];
  LoanModel? loans;

  Future fetchLoan(bank) async {
    try {
      loanList.clear();
      CollectionReference loanRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('loans');
      QuerySnapshot loanSnapshot =
          await loanRef.where('bank', isEqualTo: bank).get();

      for (var doc in loanSnapshot.docs) {
        String loanid = doc['loanid'];
        int loanAccountNumber = doc['loanAccountNumber'];
        String customerName = doc['customerName'];
        int loanAmount = doc['loanAmount'];
        int mobileNumber = doc['mobileNumber'];
        String dueDate = doc['dueDate'];
        String reminderDate = doc['reminderDate'];
        String bank = doc['bank'];
        bool loanStatus = doc['loanStatus'];

        loans = LoanModel(
            loanid: loanid,
            loanAccountNumber: loanAccountNumber,
            customerName: customerName,
            loanAmount: loanAmount,
            mobileNumber: mobileNumber,
            dueDate: dueDate,
            reminderDate: reminderDate,
            bank: bank,
            loanStatus: loanStatus);
        loanList.add(loans!);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateLoanStatus(
    String collectionName,
    String billid,
    bool newValue,
  ) async {
    try {
      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection(collectionName)
          .doc(billid);
      await docRef.update({'loanStatus': newValue});
    } catch (e) {
      print('update failed : $e');
    }
  }

  //-------------------ADD & FETCH RECHARGE-------------------------------------
  MobileRechargeModel? _mobRechargeModel;
  MobileRechargeModel get mobRechargeModel => _mobRechargeModel!;
  final rechargeUserKey = GlobalKey<FormState>();
  TextEditingController operatorController = TextEditingController();
  TextEditingController rechargeDateController = TextEditingController();
  TextEditingController rechargeExpiryDateController = TextEditingController();
  TextEditingController rechargeReminderDateController =
      TextEditingController();
  TextEditingController rechargeCustomerNameController =
      TextEditingController();
  TextEditingController rechargeCustomerNumberController =
      TextEditingController();

  Future<void> storeMobRecharge(
    String operator,
    String rechargeDate,
    String rechargeExpiryDate,
    String rechargeReminderDate,
    String rechargeCustomerName,
    int rechargeCustomerNumber,
  ) async {
    try {
      _mobRechargeModel = MobileRechargeModel(
          mobOperator: operator,
          mobRechargeDate: rechargeDate,
          mobRechargeExpiryDate: rechargeExpiryDate,
          mobRechargeReminderDate: rechargeReminderDate,
          mobCustomerName: rechargeCustomerName,
          mobCustomerNumber: rechargeCustomerNumber);
      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('mobileRecharge').doc();
      docs.set(_mobRechargeModel!.toMap(docs.id));
    } catch (e) {
      print('Mob Recharge Added Failed : $e');
    }
  }

  List<MobileRechargeModel> mobRechargeList = [];
  MobileRechargeModel? mobRecharges;

  Future fetchMobRecharges() async {
    try {
      mobRechargeList.clear();
      CollectionReference mobRechargeRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('mobileRecharge');

      QuerySnapshot mobRechargeSnapshot = await mobRechargeRef.get();
      for (var doc in mobRechargeSnapshot.docs) {
        String rechargeid = doc['mobRechargeid'];
        String operator = doc['mobOperator'];
        String rechargeDate = doc['mobRechargeDate'];
        String rechargeExpiryDate = doc['mobRechargeExpiryDate'];
        String rechargeReminderDate = doc['mobRechargeReminderDate'];
        String rechargeCustomerName = doc['mobCustomerName'];
        int rechargeCustomerNumber = doc['mobCustomerNumber'];

        mobRecharges = MobileRechargeModel(
            mobRechargeid: rechargeid,
            mobOperator: operator,
            mobRechargeDate: rechargeDate,
            mobRechargeExpiryDate: rechargeExpiryDate,
            mobRechargeReminderDate: rechargeReminderDate,
            mobCustomerName: rechargeCustomerName,
            mobCustomerNumber: rechargeCustomerNumber);
        mobRechargeList.add(mobRecharges!);
      }
    } catch (e) {
      print(e);
    }
  }

  //ADD & FETCH NEW OPERATOR
  AddOperator? _addOperator;
  AddOperator get addOperator => _addOperator!;

  TextEditingController addNewOperatorController = TextEditingController();
  Future<void> addNewOperator(
    String newOperator,
  ) async {
    try {
      _addOperator = AddOperator(operatorName: newOperator);
      await firebaseFirestore
          .collection('mobileOperators')
          .doc(newOperator)
          .set(_addOperator!.toMap());
    } catch (e) {
      print('Adding new operator failed : $e');
    }
  }

  List<AddOperator> operatorsList = [];
  AddOperator? newOperator;

  Future<void> fetchOperators() async {
    try {
      operatorsList.clear();
      CollectionReference operatorsRef =
          firebaseFirestore.collection('mobileOperators');
      QuerySnapshot operatorsSnapshot = await operatorsRef.get();

      for (var doc in operatorsSnapshot.docs) {
        String operatorName = doc['operatorName'];

        newOperator = AddOperator(operatorName: operatorName);
        operatorsList.add(newOperator!);
      }
    } catch (e) {
      print('Operator fetch failed : $e');
    }
  }

  //-------------------ADD & FETCH DTH RECHARGE-------------------------------------
  DTHRechargeModel? _dthRechargeModel;
  DTHRechargeModel get dthRechargeModel => _dthRechargeModel!;

  final dthRechargeUserKey = GlobalKey<FormState>();
  TextEditingController dthOperatorController = TextEditingController();
  TextEditingController dthRechargeDateController = TextEditingController();
  TextEditingController dthRechargeExpiryDateController =
      TextEditingController();
  TextEditingController dthRechargeReminderDateController =
      TextEditingController();
  TextEditingController dthRechargeCustomerNameController =
      TextEditingController();
  TextEditingController dthRechargeAmountController = TextEditingController();
  TextEditingController dthSubscriberIDController = TextEditingController();
  final dthSubscriberIDKey = GlobalKey<FormState>();

  Future<void> storeDTHRecharge(
    String operator,
    String rechargeDate,
    String rechargeExpiryDate,
    String rechargeReminderDate,
    String rechargeCustomerName,
    int rechargeAmount,
  ) async {
    try {
      _dthRechargeModel = DTHRechargeModel(
          dthOperator: operator,
          dthRechargeDate: rechargeDate,
          dthRechargeExpiryDate: rechargeExpiryDate,
          dthRechargeReminderDate: rechargeReminderDate,
          dthCustomerName: rechargeCustomerName,
          dthBillAmount: rechargeAmount);
      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('dthRecharge').doc();
      docs.set(_dthRechargeModel!.toMap(docs.id));
    } catch (e) {
      print('Mob Recharge Added Failed : $e');
    }
  }

  List<DTHRechargeModel> dthRechargeList = [];
  DTHRechargeModel? dthRecharges;

  Future fetchDTHRecharges() async {
    try {
      dthRechargeList.clear();
      CollectionReference dthRechargeRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('dthRecharge');

      QuerySnapshot dthRechargeSnapshot = await dthRechargeRef.get();
      for (var doc in dthRechargeSnapshot.docs) {
        String rechargeid = doc['dthRechargeid'];
        String operator = doc['dthOperator'];
        String rechargeDate = doc['dthRechargeDate'];
        String rechargeExpiryDate = doc['dthRechargeExpiryDate'];
        String rechargeReminderDate = doc['dthRechargeReminderDate'];
        String rechargeCustomerName = doc['dthCustomerName'];
        int rechargeCustomerNumber = doc['dthBillAmount'];

        dthRecharges = DTHRechargeModel(
            dthRechargeid: rechargeid,
            dthOperator: operator,
            dthRechargeDate: rechargeDate,
            dthRechargeExpiryDate: rechargeExpiryDate,
            dthRechargeReminderDate: rechargeReminderDate,
            dthCustomerName: rechargeCustomerName,
            dthBillAmount: rechargeCustomerNumber);
        dthRechargeList.add(dthRecharges!);
      }
    } catch (e) {
      print(e);
    }
  }

  //ADD & FETCH NEW OPERATOR
  AddDTHOperator? _addDTHOperator;
  AddDTHOperator get addDTHOperator => _addDTHOperator!;

  TextEditingController addNewDTHOperatorController = TextEditingController();
  Future<void> addNewDTHOperator(
    String newOperator,
  ) async {
    try {
      _addDTHOperator = AddDTHOperator(operatorName: newOperator);
      await firebaseFirestore
          .collection('dthOperators')
          .doc(newOperator)
          .set(_addDTHOperator!.toMap());
    } catch (e) {
      print('Adding new operator failed : $e');
    }
  }

  List<AddDTHOperator> dthOperatorsList = [];
  AddDTHOperator? newDTHOperator;

  Future<void> fetchDTHOperators() async {
    try {
      dthOperatorsList.clear();
      CollectionReference dthoperatorsRef =
          firebaseFirestore.collection('dthOperators');
      QuerySnapshot dthoperatorsSnapshot = await dthoperatorsRef.get();

      for (var doc in dthoperatorsSnapshot.docs) {
        String operatorName = doc['operatorName'];

        newDTHOperator = AddDTHOperator(operatorName: operatorName);
        dthOperatorsList.add(newDTHOperator!);
      }
    } catch (e) {
      print('Operator fetch failed : $e');
    }
  }

  //--------------------------------ADD & FETCH INSURANCE-----------------------

  InsuranceModel? _insuranceModel;
  InsuranceModel get insuranceModel => _insuranceModel!;
  final insuranceAddKey = GlobalKey<FormState>();

  TextEditingController insuranceTypeController = TextEditingController();
  TextEditingController insuranceDateController = TextEditingController();
  TextEditingController insuranceDateExpiryController = TextEditingController();
  TextEditingController insuranceDateReminderController =
      TextEditingController();
  TextEditingController insuranceCustomerNameController =
      TextEditingController();
  TextEditingController insuranceCustomerNumberController =
      TextEditingController();

  final insurancePayKey = GlobalKey<FormState>();
  TextEditingController insuranceCompanyNameController =
      TextEditingController();
  TextEditingController insurancePolicyNumberController =
      TextEditingController();

  Future<void> storeInsurance(
    String insuranceType,
    String insuranceDate,
    String insuranceExpiryDate,
    String insuranceReminderDate,
    String insuranceCustomerName,
    int insuranceCustomerNumber,
  ) async {
    try {
      _insuranceModel = InsuranceModel(
          insuranceType: insuranceType,
          insuranceDate: insuranceDate,
          insuranceExpiryDate: insuranceExpiryDate,
          insuranceReminderDate: insuranceReminderDate,
          insuranceCustomerName: insuranceCustomerName,
          insuranceCustomerNumber: insuranceCustomerNumber);

      final data = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      final docs = data.collection('insurance').doc();
      docs.set(_insuranceModel!.toMap(docs.id));
    } catch (e) {
      print('Styore Insure failed : $e');
    }
  }

  List<InsuranceModel> insuranceList = [];
  InsuranceModel? insure;

  Future fetchInsurance() async {
    try {
      insuranceList.clear();
      CollectionReference insureRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('insurance');

      QuerySnapshot insureSnapshot = await insureRef.get();
      for (var doc in insureSnapshot.docs) {
        String insuranceID = doc['insuranceID'];
        String insuranceType = doc['insuranceType'];
        String insuranceDate = doc['insuranceDate'];
        String insuranceExpiryDate = doc['insuranceExpiryDate'];
        String insuranceReminderDate = doc['insuranceReminderDate'];
        String insuranceCustomerName = doc['insuranceCustomerName'];
        int insuranceCustomerNumber = doc['insuranceCustomerNumber'];

        insure = InsuranceModel(
            insuranceID: insuranceID,
            insuranceType: insuranceType,
            insuranceDate: insuranceDate,
            insuranceExpiryDate: insuranceExpiryDate,
            insuranceReminderDate: insuranceReminderDate,
            insuranceCustomerName: insuranceCustomerName,
            insuranceCustomerNumber: insuranceCustomerNumber);
        insuranceList.add(insure!);
      }
    } catch (e) {
      print(e);
    }
  }
}
