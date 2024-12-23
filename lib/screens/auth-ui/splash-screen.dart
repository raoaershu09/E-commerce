import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/screens/auth-ui/welcome-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => WelcomeScreen());
    }
    );
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
                child: Lottie.asset('assets/images/animation-icon.json'),
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