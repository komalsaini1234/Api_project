import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List cate = ["iPhone", "OPPO", "Samsung", "Microsoft Surface"];
    return Container(
      height: 90,
      color: Colors.black,
      child: ListView.builder(
        itemCount: cate.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                cate[index],
                style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
