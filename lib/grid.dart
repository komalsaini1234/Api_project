import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
      backgroundColor: Color.fromARGB(255, 103, 161, 209),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: models.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: size.height / 2,
            width: size.width,
            child: Column(
              children: [
                Text(models[index].title),
                Text(models[index].description),
                Text(models[index].brand),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewClass(
                            title: models[index].title,
                            description: models[index].description,
                            price: models[index].price.toString(),
                            discountPercentage:
                                models[index].discountPercentage.toString(),
                            rating: models[index].rating.toString(),
                            stock: models[index].stock.toString(),
                            brand: models[index].brand,
                            category: models[index].category,
                            ImagePath: "https://picsum.photos/id/1/200/300",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                        "https://picsum.photos/id/1/200/300",
                        fit: BoxFit.cover,
                        scale: 1.5,
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
