// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptopharbor/models/cart-model.dart';
import 'package:laptopharbor/models/product-model.dart';
import 'package:laptopharbor/screens/user-panel/cart-screen.dart';
import 'package:laptopharbor/utils/app-constant.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel productModel;
 ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  User? user=FirebaseAuth.instance.currentUser;

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
        actions: [
           GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart
            ),
            ),
          ),
        ],
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
                    onPressed: () async {
                      // Get.to(() => SignInScreen());

                      await checkProductExistence(uId: user!.uid);
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

  // checkout product exist or not

  Future<void> checkProductExistence({
  required String uId,
  int quantityIncrement = 1,
  }) async{
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = double.parse(widget.productModel.isDiscount
              ? widget.productModel.DiscountPrice
              : widget.productModel.fullPrice) *
          updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });

      print("product exists");
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      CartModel cartModel = CartModel(
        productId: widget.productModel.productId,
        categoryId: widget.productModel.categoryId,
        productName: widget.productModel.productName,
        categoryName: widget.productModel.categoryName,
        DiscountPrice: widget.productModel.DiscountPrice,
        fullPrice: widget.productModel.fullPrice,
        productImages: widget.productModel.productImages,
        deliveryTime: widget.productModel.deliveryTime,
        isDiscount: widget.productModel.isDiscount,
        productDescription: widget.productModel.productDescription,
        createdAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: double.parse(widget.productModel.isDiscount
            ? widget.productModel.DiscountPrice
            : widget.productModel.fullPrice),
      );

      await documentReference.set(cartModel.toMap());

      print("product added");
    }
  }
}