// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, file_names, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/controllers/forget-password-controller.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: Text("Forget Password  ",
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
                    controller: userEmail,
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
                  child: Text("Forget",
                  style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 18.0,
                  ),
                  ),
                  onPressed: () async {
                      String email = userEmail.text.trim();
                      if (
                        email.isEmpty) {
                        Get.snackbar(
                        "Error",
                        "Please enter all details",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor, 
                        );
                        } else {
                          String email = userEmail.text.trim();
                          forgetPasswordController.ForgetPasswordMethod(email);
                        }

                        },
                        ),
                        ),
                        ),

            SizedBox(
                height: Get.height / 20,
              ),

            
            ],
          ),
        ),
      );
    }
    );
  }
}