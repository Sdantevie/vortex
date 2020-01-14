import 'package:flutter/material.dart';
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
          },
          child: Image.network(
            comic.imageUrl,
            height: 180,
            fit: BoxFit.cover,
          ),
        ));
  }
}
