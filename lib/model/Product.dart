import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}


List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/model1.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/model2.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/model3.jpeg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/model4.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/model5.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/model6.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 7,
    title: "Party Dress",
    price: 224,
    size: 12,
    description: dummyText,
    image: "assets/images/model7.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 8,
    title: "For Model",
    price: 299,
    size: 12,
    description: dummyText,
    image: "assets/images/model8.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 9,
    title: "British Style",
    price: 231,
    size: 12,
    description: dummyText,
    image: "assets/images/model9.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 10,
    title: "Party dress",
    price: 330,
    size: 12,
    description: dummyText,
    image: "assets/images/model10.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 11,
    title: "fancy",
    price: 300,
    size: 12,
    description: dummyText,
    image: "assets/images/model11.jpg",
    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 11,
    title: "fancy",
    price: 300,
    size: 12,
    description: dummyText,
    image: "assets/images/model12.jpg",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
