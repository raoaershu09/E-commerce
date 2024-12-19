// ignore: file_names
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appSecondoryColor,
        title: Text("Welcome to my app",
        style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      
      body: Container(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset("assets/images/animation-icon.json"),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text("Happy Buying",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset(
                    'assets/images/google.png',
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  label: Text("Sign in with google",
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
              height: Get.height / 50,
            ),

            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  icon:Icon(
                    CupertinoIcons.mail,
                    color: AppConstant.appTextColor,
                  
                  ),
                  label: Text("Sign in with email",
                  style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 18.0,
                  ),
                  ),
                  onPressed: () {},
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}