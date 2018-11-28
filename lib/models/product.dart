import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isfavorite;
  final String userEmail;
  final String userId;

  Product({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,
    @required this.userId,
    @required this.userEmail,
    this.isfavorite = false
    });
}