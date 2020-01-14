import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vortex/models/comic_category.dart';

import 'comic_preview_dynamic_header.dart';
import 'comic_reader.dart';

class ComicCategoryPreview extends StatelessWidget {
  final ComicCategory category;
  ComicCategoryPreview({Key key, @required this.category}) : super(key: key);

  Widget build(BuildContext context) {
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
        body: _buildScrollable(context),
      ),
    );
  }

  String _getComicUrl() {
  
  }

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: ComicPreviewDynamicHeader(
              args: ComicPreviewDynamicHeaderArgs.fromParams(
                  title: this.category.title,
                  imageUrl: this.category.imageUrl,
                  comicUrl: _getComicUrl())),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          this.category.summary.isNotEmpty
              ? Container(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 38.0, bottom: 8.0),
                  child: Text(
                    this.category.summary,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                )
              : Container(),
          (category.tags != null && category.tags.isNotEmpty)
              ? Wrap(
                  children: <Widget>[
                    ...category.tags
                        .map(
                          (tag) => Container(
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF691F),
                                borderRadius: BorderRadius.circular(4.0)),
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              tag,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12.0),
                            ),
                          ),
                        )
                        .toList()
                  ],
                )
              : Container(),
          Padding(
            child: Text(
              'Issues',
              style: TextStyle(
                  color: Color(0xFFD71786),
                  fontFamily: 'OpenSans',
                  fontSize: 21.0),
            ),
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 2.0),
          )
        ])),
        SliverPadding(
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 14.0,
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      _buildGridItem(context, index),
                  childCount: this.category.comics.length),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0))
      ],
    );
  }

  _buildGridItem(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     boxShadow: [
        //       BoxShadow(
        //           color: Colors.black54,
        //           offset: Offset(0.0, 4.0),
        //           blurRadius: 1.0)
        //     ]),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/comic_preview',
                arguments: this.category.comics[index]);
          },
          child: Image.network(
            this.category.comics[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
