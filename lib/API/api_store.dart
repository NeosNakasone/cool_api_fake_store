import 'package:api_fake_store/model/product.dart';
import 'package:http/http.dart' as http;

class ApiStore {
  Future<List<Product>> getProducts() async {
    var client = http.Client();

    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);
    //if (response.statusCode == 200) {
    var json = response.body;
    return productFromJson(json);
    //}
  }
}
