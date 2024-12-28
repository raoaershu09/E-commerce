// ignore_for_file: file_names, unnecessary_overrides, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class BannerController extends GetxController {
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
  }

  // fetch bannners

  Future<void> fetchBannersUrls() async{
    try {
      QuerySnapshot bannnersSnapshots = 
      await FirebaseFirestore.instance
      .collection('banners')
      .get();

      if (bannnersSnapshots.docs.isNotEmpty) {
        bannerUrls.value = bannnersSnapshots.docs.map((doc) => doc['ImageUrl'] as String)
        .toList();        
      }
      }
      catch (e) {
        print("error: $e");
      }
  }
  
}