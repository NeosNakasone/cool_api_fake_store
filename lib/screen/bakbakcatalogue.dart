import 'package:api_fake_store/API/api_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_fake_store/model/babakproduct.dart';

import '../model/product_cata.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  int _currentIndex = 0;

  List<Product>? products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data api
    getData();
  }

  getData() async {
    products = (await ApiStore().getProducts())?.cast<Product>();
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        /*actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.square,
            ),
            onPressed: onPressed, icon: icon)
        ],*/
      ),
      body: isLoaded
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                return ProductCata(
                    title: products![index].title,
                    price: products![index].price.toString(),
                    image: products![index].image);
              }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.transparent,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            backgroundColor: Colors.transparent,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Colors.transparent,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.transparent,
            label: '',
          ),
        ],
      ), //ling comma makes auto-formatting nicer for build methods.
    );
  }
}
