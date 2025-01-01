// ignore_for_file: file_names, non_constant_identifier_names

class CartModel {
  final String productId;
  final String categoryId;
  final String productName;
  final String categoryName;
  final String DiscountPrice;
  final String fullPrice;
  final List productImages;
  final String deliveryTime;
  final bool isDiscount;
  final String productDescription;
  final dynamic createdAt;
  final int productQuantity;
  final double productTotalPrice;

  CartModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.DiscountPrice,
    required this.fullPrice,
    required this.productImages,
    required this.deliveryTime,
    required this.isDiscount,
    required this.productDescription,
    required this.createdAt,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'categoryName': categoryName,
      'DiscountPrice': DiscountPrice,
      'fullPrice': fullPrice,
      'productImages': productImages,
      'deliveryTime': deliveryTime,
      'isDiscount': isDiscount,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      categoryName: json['categoryName'],
      DiscountPrice: json['DiscountPrice'],
      fullPrice: json['fullPrice'],
      productImages: json['productImages'],
      deliveryTime: json['deliveryTime'],
      isDiscount: json['isDiscount'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
    );
  }
}
