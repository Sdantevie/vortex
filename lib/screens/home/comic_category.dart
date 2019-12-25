import 'package:flutter/material.dart';
import 'package:vortex/models/comic_category.dart';

import 'comic_preview_dynamic_header.dart';

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

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: ComicPreviewDynamicHeader(
              title: this.category.title,
              backgroundImageUrl: this.category.imageUrl),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  _buildComics(context, index)),
        )
      ],
    );
  }

  _buildComics(BuildContext context, int index) {
    return Container(
      
    )
  }
}
