import 'package:flutter/material.dart';

class Product {
  String name;
  String image;
  double rating;
  String price;
  String brand;
  String description;
  int totalReviews;
  List<String> sizes;
  List<ProductColor> colors;
  int quantity;

  Product({
    required this.name,
    required this.image,
    required this.brand,
    required this.price,
    required this.rating,
    required this.description,
    required this.totalReviews,
    required this.sizes,
    required this.colors,
    this.quantity = 0,
  });
}

class ProductColor {
  final String colorName;
  final MaterialColor color;

  ProductColor({
    required this.colorName,
    required this.color,
  });
}
