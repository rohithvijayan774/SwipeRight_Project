import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  String selectedMode = 'GooglePay';
  void changePaymentMode(value) {
    selectedMode = value;
    notifyListeners();
  }
}
