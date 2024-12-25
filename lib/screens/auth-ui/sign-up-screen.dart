// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/controllers/sign-up-controller.dart';

import 'package:laptopharbor/screens/auth-ui/sign-in-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: Text("Sign Up",
          style: TextStyle(
            color: AppConstant.appTextColor,
          ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                 SizedBox(
                  height: Get.height / 20,
                ),
                 Container(
                  alignment: Alignment.center,
                  child: Text("Welcome to my app",
                  style: TextStyle(color: AppConstant.appSecondoryColor,fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  ),
                  )
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
                    child: TextFormField(
                      controller: userName,
                      cursorColor: AppConstant.appSecondoryColor,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "UserName",
                        prefixIcon: Icon(Icons.person),
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
                      controller: userPhone,
                      cursorColor: AppConstant.appSecondoryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone),
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
                      controller: userCity,
                      cursorColor: AppConstant.appSecondoryColor,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        hintText: "City",
                        prefixIcon: Icon(Icons.location_pin),
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
                      obscureText: signUpController.isPasswordVisible.value,
                      cursorColor: AppConstant.appSecondoryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signUpController.isPasswordVisible.toggle();
                          },
                        child:
                        signUpController.isPasswordVisible.value
                      ?  Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                        ),

                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
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
                    child: Text("SIGN UP",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 18.0,
                    ),
                    ),
                    onPressed: () async {
                      String name = userName.text.trim();
                      String email = userEmail.text.trim();
                      String phone = userPhone.text.trim();
                      String city = userCity.text.trim();
                      String password = userPassword.text.trim();
                      String userDeviceToken = '';

                      if (
                      name.isEmpty ||
                      email.isEmpty ||
                      phone.isEmpty ||
                      city.isEmpty ||
                      password.isEmpty ) {
                        Get.snackbar(
                        "Error",
                        "Please enter all details",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor,
                        );
                        } else {
                          UserCredential? userCredential =
                          await signUpController.signUpMethod(
                            name,
                            email,
                            phone,
                            city,
                            password,
                            );
                            
                            if (userCredential != null) {
                            Get.snackbar(
                              "Verification email sent.",
                              "Please check your email.",
                              snackPosition: SnackPosition.BOTTOM,backgroundColor: AppConstant.appSecondoryColor,colorText: AppConstant.appTextColor,
                        );
                            
                      await  FirebaseAuth.instance.signOut();
                        Get.offAll(() => SignInScreen());
                        }
                        }
                    },
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
                    "Already have an account? ",
                    style: TextStyle(color: AppConstant.appSecondoryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignInScreen()),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: AppConstant.appSecondoryColor,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}