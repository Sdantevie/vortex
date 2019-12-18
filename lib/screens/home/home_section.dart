import 'package:flutter/material.dart';

import '../../models/comic.dart';
class HomeSection extends StatefulWidget {
  final String name;
  HomeSection({@required this.name});

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  List<Comic> _comics = [
    Comic(title: 'FolkTales', imageUrl: 'https://vortex247.com/wp-content/uploads/2019/11/FLK-COVER.jpg'),
    Comic(title: 'Anikulapo #1: Orishirishi', imageUrl: 'https://vortex247.com/wp-content/uploads/2019/10/Anikulapo.jpg')];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.name, 
            style: TextStyle(color: Color(0xFFD71786), fontFamily: 'OpenSans', fontSize: 22.0)
          ),
          Divider(color: Color(0xFFFF691F),),
          HomeComicCard(comic: _comics[0],),
        ],
      ),
    );
  }
}

class HomeComicCard extends StatelessWidget {
  final Comic comic;

  HomeComicCard({@required this.comic});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.comic.title, style: TextStyle(color: Colors.white),),
    );
  }
}