import 'dart:convert';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/grid.dart';
import 'package:flutter_api/modal.dart';
import 'package:flutter_api/newClass.dart';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Product> products = [];

  Future<void> getAllProducts() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      // Multiple products
      setState(() {
        products = (data['products'] as List<dynamic>)
            .map((item) => Product.fromJson(item))
            .toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color.fromARGB(255, 245, 241, 241),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            products[index].title,
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            products[index].description,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          // Inside the itemBuilder of ListView.builder
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => grid()));
                                },
                                child: Image.network(
                                  "https://picsum.photos/id/1/200/300",
                                  scale: 1.5,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              AnimatedRatingStars(
                                  starSize: 25,
                                  onChanged: (v) {},
                                  customFilledIcon: Icons.star,
                                  customHalfFilledIcon: Icons.star_half,
                                  customEmptyIcon: Icons.star_border),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            // GridView.builder(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //   itemCount: products.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       child: Column(
            //         children: [Text(products[index].title)],
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
