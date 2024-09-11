import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  late int id;
  late double price;
  late String name, image, brand, description;
  late List<String> thumbnails;
  bool isFar = false;

  Product(
      {required this.id,
      required this.price,
      required this.name,
      required this.image,
      required this.thumbnails});
  //صناعة الكائنات من المنتجات"Product" من الماب

  Product.fromMap(Map<String, dynamic> row) {
    id = row["id"];
    price = row["price"];
    name = row["name"];
    image = row["image"];
    thumbnails = row["thumbnails"];
    brand = row["brand"];
    description = row["description"];
  }
}
