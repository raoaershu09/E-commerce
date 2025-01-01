// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laptopharbor/screens/user-panel/all-categories-screen.dart';
import 'package:laptopharbor/screens/user-panel/all-discount-price.dart';
import 'package:laptopharbor/screens/user-panel/all-products-screen.dart';

import 'package:laptopharbor/utils/app-constant.dart';
import 'package:laptopharbor/widgets/all-products-widgets.dart';

import 'package:laptopharbor/widgets/banner-widget.dart';

import 'package:laptopharbor/widgets/category-widget.dart';

import 'package:laptopharbor/widgets/custom-drawer-widget.dart';
import 'package:laptopharbor/widgets/discount-widget.dart';

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
              onTap: () => Get.to(() => AllCategoriesScreen()),
              buttonText: "See More>",
            ),

            CategoriesWidget(),

            // heading
            HeadingWidget(
              headingTitle: "New Year Discount!!",
              headingSubTitle: "According to your budget",
              onTap: () => Get.to(() => AllDiscountPriceScreen()),
              buttonText: "See More>",
            ),

            DiscountWidget(),

            // heading
            HeadingWidget(
              headingTitle: "All Products",
              headingSubTitle: "According to your budget",
              onTap: () => Get.to(() => AllProductsScreen()),
              buttonText: "See More>",
            ),

            AllProductsWidget(),

          ],
        ),
      ),
    );
  }
}
