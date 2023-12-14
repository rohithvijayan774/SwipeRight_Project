import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swiperight/models/medcine_model.dart';

class MedicineController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final addMedicineKey = GlobalKey<FormState>();
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicineDateController = TextEditingController();
  TextEditingController medicineReminderDateController =
      TextEditingController();
  TextEditingController medicineSelectGroupController = TextEditingController();
  TextEditingController medicineNotesController = TextEditingController();
  DateTime? expiryDate;
  DateTime? selectedFormattedDate;
  DateTime? selectedReminderDate;

  Future<void> selectDateForMedicineExpiry(
      context, selectedDate, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      expiryDate = picked;
      print('Expiry Date : $expiryDate');
      selectedDate = picked;
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Future<void> selectDateForMedicineReminder(
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

  NewMedicineGroup? _newMedicineGroup;
  NewMedicineGroup get newMedicineGroup => _newMedicineGroup!;

  TextEditingController addNewMedicineGroupController = TextEditingController();
  Future<void> addNewMedicineGroup(
    String medicineGroup,
  ) async {
    try {
      print('Started adding************');
      _newMedicineGroup = NewMedicineGroup(groupName: medicineGroup);
      await firebaseFirestore
          .collection('medicineGroup')
          .doc(medicineGroup)
          .set(_newMedicineGroup!.toMap());
    } catch (e) {
      print('Adding new food group failed : $e');
    }
  }

  Future<void> clearMedicineFields() async {
    medicineNameController.clear();
    medicineDateController.clear();
    medicineReminderDateController.clear();
    medicineSelectGroupController.clear();
    medicineNotesController.clear();
    notifyListeners();
  }
}
