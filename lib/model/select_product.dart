import 'package:api_fake_store/model/product.dart';
import 'package:api_fake_store/model/product_detail.dart';
import 'package:flutter/material.dart';

class SelectProduct extends StatelessWidget {
  const SelectProduct({Key? key, required this.products}) : super(key: key);

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Produit',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ProductDetail(
          title: products.title,
          price: products.price.toString() + " \€",
          image: products.image,
          description: products.description),
    );
  }
}
