// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:laptopharbor/utils/app-constant.dart';

import 'package:laptopharbor/widgets/banner-widget.dart';

import 'package:laptopharbor/widgets/category-widget.dart';

import 'package:laptopharbor/widgets/custom-drawer-widget.dart';

import 'package:laptopharbor/widgets/heading-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName,
        style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 90.0,
            ),

            // banners
            BannerWidget(),

            // heading
            HeadingWidget(
              headingTitle: "Categories",
              headingSubTitle: "According to your budget",
              onTap: (){},
              buttonText: "See More>",
            ),

            CategoriesWidget(),

            HeadingWidget(
              headingTitle: "Flash Sale",
              headingSubTitle: "According to your budget",
              onTap: (){},
              buttonText: "See More>",
            ),

          ],
        ),
      ),
    );
  }
}
