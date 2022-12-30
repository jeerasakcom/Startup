import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';




class ProductModel {
  final int code;
  final String name;
  final String detail;
  final int price;
  final int quantity;
  late final String category;
  final String images;

  ProductModel({
    required this.code,
    required this.name,
    required this.detail,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'detail': detail,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      code: map['code'] as int,
      name: map['name'] as String,
      detail: map['detail'] as String,
      price: map['price'] as int,
      quantity: map['quantity'] as int,
      category: map['category'] as String,
      images: map['images'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
