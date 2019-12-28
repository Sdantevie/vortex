import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vortex/screens/home/home_section_details.dart';

import 'package:http/http.dart' as http;

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
                      // Navigator.of(context)
                      //     .pushNamed('/comic_preview', arguments: comic);

                      getFileFromUrl(
                              'https://vortex247.com/wp-content/uploads/2019/12/Folktales-2-Compressed.pdf')
                          .then((file) {
                        Navigator.of(context)
                            .pushNamed('/comic_reader', arguments: file.path);
                      });
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

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/sample.pdf');

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception('Error Opening url file');
    }
  }
}
