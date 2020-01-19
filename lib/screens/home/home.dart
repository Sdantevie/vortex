import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vortex/blocs/app_bloc/app_bloc.dart';
import 'package:vortex/blocs/home_bloc/home_bloc.dart';
import 'package:vortex/blocs/home_bloc/home_states.dart';
import 'package:vortex/models/character.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import 'package:vortex/models/tags.dart';

import 'home_section.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  List<Comic> _comicsCover = [
    Comic(
        title: 'Wraith House',
        summary:
            'The Chimera is aware of the Wrath House plot against them using Antoli Umar as a tool to expose and..',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/03/Wrath-House-2-Cover-e1552046913663.jpg'),
  ];

  //List<String> _list = ['Trending Now', 'Latest Release', 'Vortex Mini'];
  List<ComicCategory> _comicCategories = [
    ComicCategory(
        comics: [],
        title: 'JUNE XII',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-junexii.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final HomeBloc homeBloc =
        HomeBloc(appBloc: BlocProvider.of<AppBloc>(context));

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _comicCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return _comicShowcase(context, index);
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              child: HomeSection(title: 'Trending Now', comics: _comicsCover),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              child: HomeSection(title: 'Latest Release', comics: _comicsCover),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              child: HomeSection(title: 'Vortex Mini', comics: _comicsCover),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
            ),
          ]),
          //padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
        );
      },
    );
  }

  _comicShowcase(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/comic_category_preview',
                arguments: _comicCategories[index]);
          },
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200.0,
            width: Curves.easeInOut.transform(value) * 450.0,
            child: widget,
          ),
        ));
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.2, 0.1),
                        blurRadius: 4.0)
                  ]),
              child: Center(
                child: Hero(
                  tag: _comicCategories[index].title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      _comicCategories[index].imageUrl,
                      height: 160.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 30,
              bottom: 40,
              child: Container(
                child: Text(
                  _comicCategories[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
