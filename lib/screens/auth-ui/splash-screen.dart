// ignore_for_file: file_names, annotate_overrides

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/controllers/get-user-data-controller.dart';

import 'package:laptopharbor/screens/admin-panel/admin-main-screen.dart';

import 'package:laptopharbor/screens/auth-ui/welcome-screen.dart';

import 'package:laptopharbor/screens/user-panel/main-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      loggedin(context);
    }
    );
  }

   Future<void> loggedin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController = Get.put(GetUserDataController());

      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData [0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());        
      }
      else{
        Get.offAll(() => MainScreen());
      }
    } 
    else{
      Get.to(WelcomeScreen());
    }
   }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondoryColor,
        elevation: 0, 
      ),
      body: Container(
        width: Get.width,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Lottie.asset('assets/images/laptop.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(color: AppConstant.appTextColor,
                fontSize: 12.0,
                fontWeight: FontWeight.bold
                ),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}