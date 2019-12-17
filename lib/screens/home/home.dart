import 'package:flutter/material.dart';
import 'package:vortex/screens/home/home_tab_selector.dart';

import 'latest_release.dart';
import 'trending_now.dart';
import 'vortex_mini.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> _views = [
    TrendingNow(),
    LatestRelease(),
    VortexMini()
  ];

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
                    print(index);
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                _views[_currentIndex]
              ]
          )
      ),
    );
  }
}