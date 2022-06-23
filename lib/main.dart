import 'package:flutter/material.dart';
import 'package:api_fake_store/screen/catalogue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Catalogue(
        title: 'Catalog',
      ),
    );
  }
}
