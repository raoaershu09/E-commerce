// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/screens/auth-ui/sign-in-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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