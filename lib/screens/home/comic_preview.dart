import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/view_utils/user_inherited.dart';

import 'comic_preview_dynamic_header.dart';

class ComicPreview extends StatelessWidget {
  final Comic comic;
  ComicPreview({Key key, @required this.comic}) : super(key: key);

  @override
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

  _buildComicAccess(BuildContext context) {
    final user = InheritedUser.of(context).provider.user;
    if (user == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'This content is for Subscription members only.',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          OutlineButton(
              borderSide: BorderSide(color: Color(0xFFFF691F)),
              onPressed: () {},
              splashColor: Color(0xFFFF691F),
              child: Text('Login', style: TextStyle(color: Colors.white)))
        ],
      );
    }
  }

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: ComicPreviewDynamicHeader(
              title: this.comic.title, backgroundImageUrl: this.comic.imageUrl),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 18.0, bottom: 8.0),
              child: Text(
                this.comic.summary,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            SizedBox(
              height: 0.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Color(0xFFFF691F),
                )),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: <Widget>[_buildComicAccess(context)],
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
