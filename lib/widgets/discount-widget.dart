// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_card/image_card.dart';

import 'package:laptopharbor/models/product-model.dart';

import 'package:laptopharbor/utils/app-constant.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: FirebaseFirestore.instance
    .collection('products')
    .where('isDiscount', isEqualTo: true)
    .get(), 
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if (snapshot.hasError) {
        return Center(
          child: Text(
            "Error"
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          height: Get.height / 5,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      }

      if (snapshot.data!.docs.isEmpty) {
        return Center(
          child: Text(
            "No products found!"
          ),
        );
      }

      if (snapshot.data != null) {
        return Container(
          height: Get.height / 4.5,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              final productData = snapshot.data!.docs[index];
              ProductModel productModel = ProductModel(
              productId: productData['productId'] ,
              categoryId: productData['categoryId'],
              productName: productData['productName'],
              categoryName: productData['categoryName'],
              fullPrice: productData['fullPrice'],
              DiscountPrice: productData['DiscountPrice'],
              productImages: productData['productImages'],
              deliveryTime: productData['deliveryTime'],
              isDiscount: productData['isDiscount'],
              productDescription: productData['productDescription'],
              createdAt: productData['createdAt'],
              );
              // CategoriesModel categoriesModel = CategoriesModel(
              //   categoryId: snapshot.data!.docs[index]['categoryId'],
              //   categoryImage: snapshot.data!.docs[index]['categoryImage'],
              //   categoryName: snapshot.data!.docs[index]['categoryName'],
              //   createdAt: snapshot.data!.docs[index]['createdAt'],
              //   updatedAt: snapshot.data!.docs[index]['updatedAt'],
              //   );
              return Row(
                children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        child: FillImageCard(
                          borderRadius: 20.0,
                          width: Get.width / 3.5,
                          heightImage: Get.height / 15,
                          imageProvider: CachedNetworkImageProvider(
                            productModel.productImages[0],
                          ),
                          title: Center(
                            child: Text(
                              productModel.productName, 
                              style: TextStyle(fontSize: 10.0),
                              ),
                              ),
                              footer: Row(
                                children: [
                                  Text(
                                    "Rs ${productModel.DiscountPrice}",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                  Text(
                                    "${productModel.fullPrice}",
                                    style: TextStyle(fontSize: 10.0,
                                    color: AppConstant.appSecondoryColor,
                                    decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          ),
                      ),
                ],
              );
            },
            ),
        );
      }
      return Container();
    }
    );
  }
}