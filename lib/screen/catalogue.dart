import 'package:api_fake_store/API/api_store.dart';
import 'package:api_fake_store/model/product_detail.dart';
import 'package:api_fake_store/model/product_cata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_fake_store/model/select_product.dart';

//import '../model/babakproduct.dart';
import '../model/product.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  int _currentIndex = 0;

  late List<Product> _products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data api
    getData();
  }

  getData() async {
    _products = await ApiStore().getProducts();
    print(_products);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        /*actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.square,
            ),
            onPressed: onPressed, icon: icon)
        ],*/
      ),
      body: !isLoaded
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                print(_products[index]);

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectProduct(
                              products: _products[index],
                            )));
                  },
                  child: ProductCata(
                      title: _products[index].title,
                      price: _products[index].price.toString() + " \€",
                      image: _products[index].image),
                );
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
