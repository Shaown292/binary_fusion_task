import 'package:binary_fusion_task/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoggedIn = false;
  String? errorMessage;

  Future<void> login({required String email,required String password,required BuildContext context}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    if (email == 'test@test.com' && password == '123456') {
      debugPrint("Success");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
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
