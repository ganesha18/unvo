import 'package:flutter/material.dart';
import 'package:unvo/model/Product.dart';

import '../constants.dart';

class ShoePage extends StatefulWidget {
  final Product product;
  const ShoePage({Key? key, required this.product}) : super(key: key);

  @override
  _ShoePageState createState() => _ShoePageState();
}

class _ShoePageState extends State<ShoePage> {
  @override
  Widget build(BuildContext context) {
    var product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 80),
          Text(
            product.title,
            style: TextStyle(
                color: kTextLightColor,
                fontWeight: FontWeight.w100,
                fontSize: 32),
          )
        ],
      ),
    );
  }
}
