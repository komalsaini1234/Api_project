import 'dart:convert';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/home_page.dart';

import 'package:flutter_api/modal.dart';
import 'package:flutter_api/newClass.dart';
import 'package:flutter_api/tab.dart';
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
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
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
                  height: size.height,
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
                                    description: models[index].description,
                                    price: models[index].price.toString(),
                                    discountPercentage: models[index]
                                        .discountPercentage
                                        .toString(),
                                    rating: models[index].rating.toString(),
                                    stock: models[index].stock.toString(),
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Image.network(
                                  "https://picsum.photos/id/1/200/300",
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 200,
                                  scale: 3,
                                ),
                              ),
                            )),
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
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.greenAccent, fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(models[index].price.toString()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
