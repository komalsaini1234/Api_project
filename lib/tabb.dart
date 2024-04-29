import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/grid.dart';

import 'package:flutter_api/home_page.dart';
import 'package:flutter_api/newClass.dart';

class tabb extends StatefulWidget {
  const tabb({super.key});

  @override
  State<tabb> createState() => _tabbState();
}

class _tabbState extends State<tabb> {
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.blue,
        width: size.width,
        height: size.height,
        child: ContainedTabBarView(
          tabs: const [
            Text(
              'iphone',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text('Samsung',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Oppo',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Microsoft Surface',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
          views: [MyHomePage(), grid(), MyHomePage(), grid()],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
