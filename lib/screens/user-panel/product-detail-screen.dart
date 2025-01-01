// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptopharbor/models/product-model.dart';
import 'package:laptopharbor/utils/app-constant.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel productModel;
 ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Product Details",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 60,
            ),
            CarouselSlider(items: widget.productModel.productImages
            .map
            ((imageUrls)  =>  ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: imageUrls,
            fit: BoxFit.cover,
            width: Get.width -10,
            placeholder: (context, url) => ColoredBox(
              color: Colors.white,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
            errorWidget: (context,url,error) => Icon(Icons.error),
            ),
      ),
      ).toList(),
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        aspectRatio: 2.5,
        viewportFraction: 1,
      ),
      ),

      Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productModel.productName
                                ),

                                 Icon(Icons.favorite_outline)

                            ],
                          )
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              widget.productModel.isDiscount == true &&
                                      widget.productModel.DiscountPrice != ''
                                  ? Text(
                                      "PKR: " + widget.productModel.DiscountPrice,
                                    )
                                  : Text(
                                      "PKR: " + widget.productModel.fullPrice,
                                    ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                           "Category: " + widget.productModel.categoryName
                           ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.productModel.productDescription
                           ),
                        ),
                      ),
                      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                  child: Container(
                  width: Get.width / 3.0,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondoryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "WhatsApp",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 18.0,
                    ),
                    ),
                    onPressed: () {
                      // Get.to(() => SignInScreen());
                    },
                  ),
                )
                ),

                SizedBox(
                  width: 5.0,
                ),

                Material(
                  child: Container(
                  width: Get.width / 3.0,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondoryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "Add to cart",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 18.0,
                    ),
                    ),
                    onPressed: () {
                      // Get.to(() => SignInScreen());
                    },
                  ),
                )
                ),
                  ],
                )
              ),
                    ],
                  ),
                ),
                ),
          ],
        ),
      ),
    );
    
  }
}