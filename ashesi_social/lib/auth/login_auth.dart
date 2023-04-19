import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userEmail = '';

  String get getUserEmail => userEmail;

  void setUserEmail(String email) {
    userEmail = email;
    notifyListeners();
  }
}
