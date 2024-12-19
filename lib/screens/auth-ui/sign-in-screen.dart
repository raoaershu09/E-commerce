// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:laptopharbor/screens/auth-ui/sign-up-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: Text("Sign In",
          style: TextStyle(
            color: AppConstant.appTextColor,
          ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible? Text("Welcome to my app")
              :Column(
                children: [
                  Lottie.asset('assets/images/animation-icon.json'),
                ],
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appSecondoryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                  ),
                )
                ),


                Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appSecondoryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility_off),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                  ),
                )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: AppConstant.appSecondoryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                height: Get.height / 20,
              ),

                 Material(
              child: Container(
                width: Get.width / 2,
                height: Get.height / 18,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  child: Text("SIGN IN",
                  style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 18.0,
                  ),
                  ),
                  onPressed: () {},
                ),
              )
            ),

            SizedBox(
                height: Get.height / 20,
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppConstant.appSecondoryColor),
                ),
                GestureDetector(
                  onTap: () => Get.offAll(() => SignUpScreen()),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppConstant.appSecondoryColor,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      );
    }
    );
  }
}