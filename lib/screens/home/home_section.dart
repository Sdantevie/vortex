import 'package:flutter/material.dart';
import 'package:vortex/screens/home/home_section_details.dart';

import '../../models/comic.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final List<Comic> comics;

  HomeSection({@required this.title, @required this.comics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(this.title,
                style: TextStyle(
                    color: Color(0xFFD71786),
                    fontFamily: 'OpenSans',
                    fontSize: 22.0)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/home_section',
                    arguments: HomeSectionDetailsArgs(
                        title: this.title, comics: this.comics));
              },
              child: Icon(
                Icons.arrow_forward,
                color: Color(0xFFFF691F),
              ),
            )
          ],
        ),
        Divider(
          color: Color(0xFFFF691F),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: this.comics.length,
            itemBuilder: (context, index) {
              Comic comic = this.comics[index];
              return Container(
                  margin: EdgeInsets.only(
                    left: 2.0,
                    right: 8.0,
                    top: 10.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0)
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/comic_preview', arguments: comic);
                    },
                    child: Image.network(
                      comic.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}
