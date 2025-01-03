// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_card/image_card.dart';

import 'package:laptopharbor/models/product-model.dart';
import 'package:laptopharbor/screens/user-panel/product-detail-screen.dart';
import 'package:laptopharbor/utils/app-constant.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: FirebaseFirestore.instance
    .collection('products')
    .where('isDiscount', isEqualTo: false)
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
        return GridView.builder(
        itemCount: snapshot.data!.docs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.90,
        ),
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
                GestureDetector(
                  onTap: () => Get.to(() =>
                   ProductDetailScreen(productModel: productModel)
                  ),        
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: FillImageCard(
                        borderRadius: 20.0,
                        width: Get.width / 2.3,
                        heightImage: Get.height / 9,
                        imageProvider: CachedNetworkImageProvider(
                          productModel.productImages[0],
                        ),
                        title: Center(
                          child: Text(
                            productModel.productName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 12.0,
                            color: AppConstant.productNameColor
                            ),
                            ),
                            ),
                            footer: Center(
                              child: Text(
                              "PKR: " +  productModel.fullPrice),
                            ),
                        ),
                        ),
                    ),
                ),
              ],
            );
          },
        );
      }
      return Container();
    }
    );
  }
}