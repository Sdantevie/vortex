import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vortex/models/comic.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;

  ComicCard({@required this.comic});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/comic_preview', arguments: comic);

            // getFileFromUrl(
            //         'https://vortex247.com/wp-content/uploads/2019/12/Folktales-2-Compressed.pdf')
            //     .then((file) {
            //   Navigator.of(context).pushNamed('/comic_reader',
            //       arguments: ComicReaderArgs(comic: comic, path: file.path));
            // });
          },
          child: Image.network(
            comic.imageUrl,
            height: 180,
            fit: BoxFit.cover,
          ),
        ));
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
