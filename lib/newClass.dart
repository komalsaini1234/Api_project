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
      backgroundColor: const Color.fromARGB(255, 103, 161, 209),
      appBar: AppBar(
        title: Text('New CLass'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              Image.network(
                ImagePath,
                scale: 1,
              ),
              Text(
                brand,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                price,
                style: TextStyle(color: Colors.amber),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                category,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                stock,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                rating,
                style: TextStyle(color: Colors.white),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
