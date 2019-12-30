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
        SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(top: 38.0, bottom: 8.0),
                child: Text(
                  this.comic.summary,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              (comic.tags != null && comic.tags.isNotEmpty)
                  ? Wrap(
                      children: <Widget>[
                        ...comic.tags
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
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Characters',
                style: TextStyle(
                    color: Color(0xFFD71786),
                    fontSize: 17.0,
                    fontFamily: 'OpenSans'),
              ),
              Divider(
                color: Color(0xFFFF691F),
              ),
              Wrap(
                children: <Widget>[],
              )
            ]),
          ),
        )
      ],
    );
  }
}
