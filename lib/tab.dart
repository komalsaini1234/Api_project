import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tab extends StatefulWidget {
  const tab({super.key});

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.blue,
        width: 200,
        height: 300,
        child: ContainedTabBarView(
          tabs: [
            Text('iphone'),
            Text('Samsung'),
            Text('Oppo'),
            Text('Microsoft Surface'),
          ],
          views: [
            Container(color: Colors.grey),
            Container(color: Colors.pink),
            Container(color: Colors.pink),
            Container(color: Colors.pink),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
