import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userEmail = '';
  String firstName = '';

  String get getUserEmail => userEmail;
  String get getFirstName => firstName;

  void setUserEmail(String email) {
    userEmail = email;
    notifyListeners();
  }

  void setFirstName(String name) {
    firstName = name;
    notifyListeners();
  }
}
