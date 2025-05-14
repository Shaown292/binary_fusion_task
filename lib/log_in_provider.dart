import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoggedIn = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Dummy login logic with delay
    await Future.delayed(Duration(seconds: 2));

    if (email == 'test@test.com' && password == '123456') {
      isLoggedIn = true;
    } else {
      errorMessage = "Invalid email or password";
    }

    isLoading = false;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
