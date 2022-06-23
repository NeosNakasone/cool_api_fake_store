// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  //int id;
  final String image;
  final String title;
  final double price;

  final String description;

  Product(
      {
      //required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.description});

  factory Product.fromJson(dynamic json) {
    return Product(
      image: json["image"] as String,
      title: json["title"] as String,
      price: json["price"].toDouble(),
      description: json["description"] as String,
    );
  }

  static List<Product> productFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product{name: $title, image: $image, price: $price}';
  }

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
      };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

/*final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});*/

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

/*class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}*/
