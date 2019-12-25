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

  List<BottomNavigationData> _bottomNavigationData = [
    BottomNavigationData(title: 'Home', icon: Icons.home),
    BottomNavigationData(title: 'Explore', icon: Icons.explore),
    //BottomNavigationData(title: 'Favourites', icon: Icons.favorite),
    BottomNavigationData(title: 'Characters', icon: Icons.people),
    BottomNavigationData(title: 'More', icon: Icons.more_horiz)
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildScrollable(),
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
    );
  }

  _buildScrollable() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 20.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Hero(
                tag: 'Search',
                child: Icon(
                  Icons.search,
                  color: Color(0xFFFF691F),
                ),
              ),
            )
          ],
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset("assets/images/vortex247.png",
                  width: 25.0, height: 25.0),
            ),
          ),
          expandedHeight: 80.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(_bottomNavigationData[_selectedIndex].title,
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _views[_selectedIndex],
              ]),
            ))
      ],
    );
  }
}

class BottomNavigationData {
  final IconData icon;
  final String title;

  BottomNavigationData({this.icon, this.title});
}
