import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Explore",
        style: TextStyle(fontSize: 100.0, color: Colors.white),
      ),
    );
  }
}
