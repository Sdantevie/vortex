import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';

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
        title: 'FolkTales',
        summary:
            'As Madam Koi Koi and her band of Folktales investigate the murder of the holy priest times races against them as the angels prepare to retaliate. Meanwhile Bush Baby runs into some friends from his past which leads to only more deeper discoveries.',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/11/FLK-COVER.jpg'),
    Comic(
        title: 'Wraith House',
        summary:
            'The Chimera is aware of the Wrath House plot against them using Antoli Umar as a tool to expose and..',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/03/Wrath-House-2-Cover-e1552046913663.jpg'),
    Comic(
        title: 'Anikulapo #1: Orishirishi',
        summary:
            'Anikulapo III is from a ancestral family of summoners, gifted with power to summon deities and celestial beast through music',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/10/Anikulapo.jpg'),
  ];

  //List<String> _list = ['Trending Now', 'Latest Release', 'Vortex Mini'];
  List<Comic> _comics = [
    Comic(
        title: 'JUNE XII',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-junexii.jpg'),
    Comic(
        title: 'BADGAIS',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-badgais.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _comics.length,
              itemBuilder: (BuildContext context, int index) {
                return _comicShowcase(index);
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          HomeSection(title: 'Trending Now', comics: _comicsCover),
          SizedBox(
            height: 20.0,
          ),
          HomeSection(title: 'Latest Release', comics: _comicsCover),
          SizedBox(
            height: 20.0,
          ),
          HomeSection(title: 'Vortex Mini', comics: _comicsCover)
        ],
      ),
    );
  }

  _comicShowcase(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200.0,
            width: Curves.easeInOut.transform(value) * 450.0,
            child: widget,
          ),
        );
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
                  tag: _comics[index].title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      _comics[index].imageUrl,
                      height: 160.0,
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
                  _comics[index].title,
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
