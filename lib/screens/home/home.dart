import 'package:flutter/material.dart';

import 'home_section.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> _list = ['Trending Now', 'Latest Release', 'Vortex Mini'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: _list.map((data) {
                return HomeSection(name: data);
              }).toList()
          )
      ),
    );
  }
}

