import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swiperight/models/food_grocery_model.dart';

class FoodGroceryController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final addFoodItemsKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController reminderDateController = TextEditingController();
  TextEditingController selectGroupController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  DateTime? selectedDate;
  DateTime? selectedReminderDate;
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

//----------------------------ADD NEW GROUP-------------------------------------

  NewFoodGroup? _newFoodGroup;
  NewFoodGroup get newFoodGroup => _newFoodGroup!;

  TextEditingController addNewGroupController = TextEditingController();
  Future<void> addNewFoodGroup(String foodGroup) async {
    try {
      await firebaseFirestore.collection('food group').doc(foodGroup).set({});
    } catch (e) {
      print('Adding new food group failed : $e');
    }

    notifyListeners();
  }
}
