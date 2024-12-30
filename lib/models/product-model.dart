// ignore_for_file: file_names

class ProductModel {
  final String productId;
  final String categoryId;
  final String productName;
  final String categoryName;
  final String fullPrice;
  final List productImages;
  final String deliveryTime;
  final bool isDiscount;
  final String productDescription;
  final dynamic createdAt;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.fullPrice,
    required this.productImages,
    required this.deliveryTime,
    required this.isDiscount,
    required this.productDescription,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'categoryName': categoryName,
      'fullPrice': fullPrice,
      'productImages': productImages,
      'deliveryTime': deliveryTime,
      'isDiscount': isDiscount,
      'productDescription': productDescription,
      'createdAt': createdAt,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      categoryName: json['categoryName'],
      fullPrice: json['fullPrice'],
      productImages: json['productImages'],
      deliveryTime: json['deliveryTime'],
      isDiscount: json['isDiscount'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
    );
  }
}