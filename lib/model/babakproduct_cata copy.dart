import 'package:flutter/material.dart';

class ProductCata extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  // ignore: use_key_in_widget_constructors
  const ProductCata({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //BOX PRINCIPAL IMAGE
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 100),
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 214, 223, 235),
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
        //Image
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 214, 223, 235),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //BOX faire pareils pour un 2e
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
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 252),
                      Text(rating),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
