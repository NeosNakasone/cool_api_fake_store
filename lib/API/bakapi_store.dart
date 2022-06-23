import 'dart:convert';
import 'package:api_fake_store/model/product.dart';
import 'package:http/http.dart' as http;

class ApiStore {
  Future<List<Product>?> getProducts() async {
    var uri = Uri.parse(
      'https://fakestoreapi.com/products',
    );

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "eyJhbGciOiJIUzI1NiIsInR",
      "x-rapidapi-host": "fakestoreapi.com",
      "userQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    return Product.productFromSnapshot(_temp);
  }
}
