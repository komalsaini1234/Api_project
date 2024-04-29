import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/modal.dart';

class NewClass extends StatelessWidget {
  final String ImagePath;
  final String title;
  final String description;
  final String price;
  final String brand;
  final String stock;
  final String rating;
  final String discountPercentage;
  final String category;

  const NewClass({
    super.key,
    required this.ImagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'New CLass',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      ImagePath,
                      scale: 1,
                    ),
                  ),
                  Text(
                    brand,
                    style: TextStyle(color: Colors.black),
                  ),
                  Divider(),
                  Text(
                    price,
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                              Text("Wishlist"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.blueAccent,
                                  size: 20,
                                ),
                                Text(
                                  "share",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    stock,
                    style: TextStyle(color: Colors.black),
                  ),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          rating,
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_money_sharp,
                    color: Colors.greenAccent,
                  ),
                  Text(
                    " 699 with 2 Special offers",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 25),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.fire_truck),
                          backgroundColor: Colors.amber,
                        ),
                        Text(
                          "Free \n Dilvery",
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 30),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.replay_circle_filled),
                          backgroundColor: Colors.amber,
                        ),
                        Text(
                          "10 days \n Replacement",
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 30),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.tv),
                          backgroundColor: Colors.amber,
                        ),
                        Text(
                          "36 Months \n warranty",
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.purple,
                        ),
                        Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.purple,
                        ),
                        Text(
                          "Buy now",
                          style: TextStyle(color: Colors.purple),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
