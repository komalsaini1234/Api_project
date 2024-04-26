import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/category.dart';

import 'package:flutter_api/modal.dart';
import 'package:flutter_api/newClass.dart';
import 'package:http/http.dart' as http;

class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  late List<Product> models = [];

  Future<void> getAllProducts() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));

    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        models = (data['products'] as List<dynamic>)
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Mobile phone",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            category(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: models.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 241, 241),
                            borderRadius: BorderRadius.circular(15)),
      
                        width: size.width * 0.4, //
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                models[index].title,
                                style: TextStyle(color: Colors.amber),
                              ),
                              Text(
                                models[index].description,
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(models[index].brand),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewClass(
                                          title: models[index].title,
                                          description:
                                              models[index].description,
                                          price:
                                              models[index].price.toString(),
                                          discountPercentage: models[index]
                                              .discountPercentage
                                              .toString(),
                                          rating:
                                              models[index].rating.toString(),
                                          stock:
                                              models[index].stock.toString(),
                                          brand: models[index].brand,
                                          category: models[index].category,
                                          ImagePath:
                                              "https://picsum.photos/id/1/200/300",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      "https://picsum.photos/id/1/200/300",
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 200,
                                      scale: 1.8,
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
