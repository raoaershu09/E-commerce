// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptopharbor/controllers/google-sign-in-controller.dart';
import 'package:laptopharbor/screens/auth-ui/sign-in-screen.dart';
import 'package:laptopharbor/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text(
          "Welcome to my app",
          style: TextStyle(
            color: AppConstant.appTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(  // Wrap the entire body with SingleChildScrollView
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height / 580.600),  // Add some space from the top
              Container(
                child: Lottie.asset("assets/images/laptop.json"),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Happy Buying",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),  // Adjust this for screen flexibility

              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: Image.asset(
                      'assets/images/google.png',
                      width: Get.width / 12,
                      height: Get.height / 12,
                    ),
                    label: Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      _googleSignInController.SignInWithGoogle();
                    },
                  ),
                ),
              ),

              SizedBox(height: Get.height / 50),

              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      CupertinoIcons.mail,
                      color: AppConstant.appTextColor,
                    ),
                    label: Text(
                      "Sign in with Email",
                      style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SignInScreen());
                    },
                  ),
                ),
              ),

              SizedBox(height: Get.height / 20),  // Adjust bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
