import 'package:binary_fusion_task/constant/app_text_style.dart';
import 'package:binary_fusion_task/constant/custom_button.dart';
import 'package:binary_fusion_task/providers/log_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import '../constant/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final TextEditingController emailTextEditingController =
        TextEditingController();
    final TextEditingController passwordTextEditingController =
        TextEditingController();
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A5AF8), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: deviceHeight * 0.75,
              width: deviceWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text("Sign in", style: AppTextStyle.inter32w600Black),
                          SizedBox(height: 10),
                          Text(
                            "Sign in to my account",
                            style: AppTextStyle.inter16w500Grey,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Text("Email", style: AppTextStyle.inter13w400Grey),
                    SizedBox(height: 10),
                    CustomTextField(
                      iconData: Icons.email_outlined,
                      hintText: "My Email",
                      controller: emailTextEditingController,
                    ),
                    SizedBox(height: 20),
                    Text("Password", style: AppTextStyle.inter13w400Grey),
                    SizedBox(height: 10),
                    CustomTextField(
                      iconData: Icons.qr_code_scanner,
                      hintText: "My Password",
                      controller: passwordTextEditingController,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    if (loginProvider.errorMessage != null)
                      Text(
                        loginProvider.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password",
                          style: AppTextStyle.inter16w400Purple,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    loginProvider.isLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                          onTap: () {
                            loginProvider.login(
                              emailTextEditingController.text.trim(),
                              passwordTextEditingController.text.trim(),
                            );
                          },
                          titleText: "Sign In",
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
