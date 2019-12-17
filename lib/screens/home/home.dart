import 'package:flutter/material.dart';
import 'package:vortex/screens/home/home_tab_selector.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                HomeTabSelector(
                tabs: ['Trending Now', 'Latest Release', 'Vortex Mini'], 
                  onItemSelected: (index){

                  },
                ),
                SizedBox(height: 20.0,)
              ]
          )
      ),
    );
  }
}
