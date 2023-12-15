import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiperight/models/electricity_bill_model.dart';
import 'package:swiperight/models/food_grocery_model.dart';
import 'package:swiperight/models/medcine_model.dart';
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
  ) async {
    try {
      _electricityBillModel = ElectricityBillModel(
          consumerNumber: consumerNumber,
          customerName: customerName,
          billAmount: billAmount,
          billDate: billDate,
          dueDate: dueDate,
          reminderDate: reminderDate,
          electricityBoard: electricityBoard);

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
          .where('electricytBoard', isEqualTo: electricityBoard)
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

        elecBills = ElectricityBillModel(
            billid: billid,
            consumerNumber: consumerNumber,
            customerName: customerName,
            billAmount: billAmount,
            billDate: billDate,
            dueDate: dueDate,
            reminderDate: reminderDate,
            electricityBoard: electricityBoard);
        elecBillsList.add(elecBills!);
      }
    } catch (e) {
      print(e);
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
}
