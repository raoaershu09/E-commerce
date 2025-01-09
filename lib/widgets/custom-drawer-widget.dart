// ignore_for_file: file_names, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:laptopharbor/screens/auth-ui/welcome-screen.dart';
import 'package:laptopharbor/screens/user-panel/all-orders-screen.dart';
import 'package:laptopharbor/screens/user-panel/all-products-screen.dart';
import 'package:laptopharbor/screens/user-panel/main-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),

        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Aershuman",
                style: TextStyle(color: Colors.white),
                ),
                subtitle: Text("Version 2.0.1",
                style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text("A",
                  style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.5,
                color: Colors.grey,
              ),

              Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Home",
                style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.home,
                  color: Colors.white,),
                  trailing: Icon(Icons.arrow_forward,
                  color: Colors.white,),

                  onTap: (){
                  Get.back();
                  Get.to(()=> MainScreen());
                },
              ),
              ),

                Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Products",
                style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.production_quantity_limits,
                color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,
                color: Colors.white,
                ),

                 onTap: (){
                  Get.back();
                  Get.to(()=> AllProductsScreen());
                },
              ),
              ),

                Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Orders",
                style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.shopping_bag_sharp,
                color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,
                color: Colors.white,),

                onTap: (){
                  Get.back();
                  Get.to(()=> AllOrdersScreen());
                },
              ),
              ),

              Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ListTile(
                onTap: () async{
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Logout",
                style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.logout,
                color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,
                color: Colors.white,),
              ),
              ),
          ],
        ),
        backgroundColor: AppConstant.appSecondaryColor,
      ),
    );
  }
}