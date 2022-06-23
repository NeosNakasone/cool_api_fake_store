import 'package:flutter/material.dart';
import 'dart:convert';

class ProductCata extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  // ignore: use_key_in_widget_constructors
  const ProductCata({
    required this.title,
    required this.price,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //BOX PRINCIPAL QUI ENGLOBE IMAGE ET DESCRIPTION
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 227, 235, 245),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        //
      ),
      child: Stack(
        children: [
          // Box image
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 257,
            decoration: BoxDecoration(
              //Image
              image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 227, 235, 245),
                  BlendMode.multiply,
                ),
                image: NetworkImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          //Text
          /*Align(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 247, 247),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    //Box 1
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 122),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.center,
          ),*/
          //Box interieur position
          Align(
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //BOX faire pareils pour un 2e
                Container(
                  //control du box
                  width: 342,
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 3),
                  margin: const EdgeInsets.only(
                      top: 270, left: 3, right: 3, bottom: 3),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 247, 247),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //Box 1
                    children: [
                      Text(title),
                      Text(price),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
