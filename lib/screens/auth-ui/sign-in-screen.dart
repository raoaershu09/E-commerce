// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, file_names, duplicate_ignore, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/controllers/get-user-data-controller.dart';

import 'package:laptopharbor/controllers/sign-in-controller.dart';
import 'package:laptopharbor/screens/admin-panel/admin-main-screen.dart';

import 'package:laptopharbor/screens/auth-ui/forget-password-screen.dart';

import 'package:laptopharbor/screens/auth-ui/sign-up-screen.dart';

import 'package:laptopharbor/screens/user-panel/main-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();TextEditingController userPassword = TextEditingController();

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
                  Lottie.asset('assets/images/laptop.json'),
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


                Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextFormField(
                    controller: userPassword,
                    obscureText: signInController.isPasswordVisible.value,
                    cursorColor: AppConstant.appSecondoryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          signInController.isPasswordVisible.toggle();
                        },
                        child: signInController.isPasswordVisible.value
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                        ),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                  ),
                  )
                )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: AppConstant.appSecondoryColor,
                        fontWeight: FontWeight.bold,
                      ),
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
                  onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();
                      if (
                        email.isEmpty || password.isEmpty ) {
                        Get.snackbar(
                        "Error",
                        "Please enter all details",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor, 
                        );
                  }

                  else{
                    UserCredential? userCredential = await signInController.signInMethod(email, password);  

                    var userData = await getUserDataController
                    .getUserData(userCredential!.user!.uid);

                  if (userCredential != null) {
                    if (userCredential.user!.emailVerified) {

                      // 
                      if (userData [0]['isAdmin'] == true) {
                        Get.offAll(() => AdminMainScreen());   
                        Get.snackbar(
                        "Success Admin Login",
                       "Login Successfully!",
                       snackPosition: SnackPosition.BOTTOM,
                       backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor, 
                       );

                        Get.offAll(() => AdminMainScreen());
                      }
                      else{
                        Get.offAll(() => MainScreen());
                         Get.snackbar(
                        "Success User Login",
                       "Login Successfully!",
                       snackPosition: SnackPosition.BOTTOM,
                       backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor, 
                       );
                      }
                    }  
                    else {
                      Get.snackbar(
                      "Error",
                      "Please verify your email before login",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appSecondoryColor,
                      colorText: AppConstant.appTextColor,
                      );
                    }
                  } 

                  else {
                    Get.snackbar(
                      "Error",
                      "Please try again",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appSecondoryColor,
                      colorText: AppConstant.appTextColor,
                      );
                  }
                  }
                  }
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