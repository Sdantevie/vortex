import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vortex/screens/explore/explore.dart';
import 'package:vortex/screens/home/home.dart';
import 'package:vortex/screens/settings/settings.dart';
import 'characters/characters.dart';

class AppContainer extends StatefulWidget {
  AppContainer({Key key}) : super(key: key);

  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _selectedIndex = 0;

  List<Widget> _views = [
    Home(),
    Explore(),
    // Favourite(),
    Characters(),
    Settings()
  ];

  _itemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    var _bottomNavigationData = [
      BottomNavigationData(title: 'Home', icon: Icons.home),
      BottomNavigationData(title: 'Explore', icon: Icons.explore),
      //BottomNavigationData(title: 'Favourites', icon: Icons.favorite),
      BottomNavigationData(title: 'Characters', icon: Icons.people),
      BottomNavigationData(title: 'More', icon: Icons.more_horiz)
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/vortex247.png",
                          width: ScreenUtil.getInstance().setWidth(70),
                          height: ScreenUtil.getInstance().setHeight(70),
                        ),
                        Hero(
                          tag: 'Search',
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFFF691F),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: _views[_selectedIndex],
                    left: 16,
                    right: 16,
                    top: _selectedIndex == 0 ? 50 : 80,
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color(0xFF040313),
                unselectedItemColor: Color(0xFFFF691F),
                selectedItemColor: Color(0xFFD71786),
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                onTap: _itemTapped,
                items: _bottomNavigationData.map((data) {
                  return BottomNavigationBarItem(
                      icon: Icon(data.icon), title: Text(data.title));
                }).toList())),
      ),
    );
  }
}

class BottomNavigationData {
  final IconData icon;
  final String title;

  BottomNavigationData({this.icon, this.title});
}
