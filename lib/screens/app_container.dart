import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vortex/blocs/app_bloc/app_states.dart';

import '../blocs/app_bloc/app_bloc.dart';
import '../blocs/app_bloc/app_events.dart';
import 'characters/character_content.dart';
import 'characters/character_tab_header.dart';
import 'favourite/favourite.dart';
import 'home/home.dart';
import 'profile/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AppContainer extends StatefulWidget {
  AppContainer({Key key}) : super(key: key);

  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _charactertabController = TabController(length: 3, vsync: this);
    characterHeader = CharacterHeader(
      tabController: _charactertabController,
    );
    characterContent = CharactersContent(
      tabController: _charactertabController,
    );
  }

  TabController _charactertabController;
  CharacterHeader characterHeader;
  CharactersContent characterContent;

  int _selectedIndex = 0;

  _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationData> _bottomNavigationData = [
    BottomNavigationData(title: 'Home', icon: Icon(Icons.home)),
    //BottomNavigationData(title: 'Explore', icon: Icon(Icons.explore)),
    BottomNavigationData(title: 'Favourites', icon: Icon(Icons.favorite)),
    BottomNavigationData(title: 'Characters', icon: CharactersIcon()),
    BottomNavigationData(title: 'Profile', icon: Icon(Icons.person))
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    //ignore: close_sinks
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    if (!(appBloc.state is AppLoadedState)) {
      appBloc.add(AppLoadDataEvent());
    }

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
                    icon: data.icon, title: Text(data.title));
              }).toList())),
    );
  }

  _launchUrl() async {
  const url = 'https://vortexcorp.net/shop/';
  if (await canLaunch(url)) {
    await launch(url);
  }
}
  _buildScrollable() {
    List<dynamic> _views = [
      Home(),
      //Explore(),
      Favourite(),
      characterHeader,
      ProfilePage()
    ];
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              icon: Icon(
                Icons.search,
                color: Color(0xFFFF691F),
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: _launchUrl,
              color: Color(0xFFFF691F),
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
        _views[_selectedIndex],
        _selectedIndex == 2
            ? characterContent
            : SliverPadding(
                padding: EdgeInsets.all(0.0),
              )
      ],
    );
  }
}

class BottomNavigationData {
  final Widget icon;
  final String title;

  BottomNavigationData({this.icon, this.title});
}

class CharactersIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Stack(fit: StackFit.expand, children: <Widget>[
        Positioned.fill(
            left: -30.0,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/Kenga.png',
                  height: 32.0, width: 40.0),
            )),
        Positioned.fill(
            right: -30.0,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/Anikulapo.png',
                    height: 35.0, width: 40.0))),
        Center(
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/Mortar.png',
                  height: 50.0, width: 40.0)),
        ),
      ]),
    );
  }
}
