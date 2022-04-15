import 'package:flutter/material.dart';
import 'package:unvo/model/Product.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return buildListTile(products[index]);
        },
      ),
    );
  }

  Widget buildListTile(Product product) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(product.image),
        ),
        title: Text(
          product.title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {},
      );
}
