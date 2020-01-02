import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';

class ComicPreviewDynamicHeader extends SliverPersistentHeaderDelegate {
  final ComicPreviewDynamicHeaderArgs args;

  ComicPreviewDynamicHeader({@required this.args});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        Image.network(
          this.args.imageUrl,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Color(0xFF040313)],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 36.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.args.title,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD71786)
                        .withOpacity(titleOpacity(shrinkOffset)),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
              ],
            )),
        Positioned(
          left: 16.0,
          top: 32.0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          child: Row(
            children: <Widget>[
              FloatingActionButton(
                elevation: 8.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: this.args.readNow,
              ),
              SizedBox(
                width: 4.0,
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(20.0)),
                child: RaisedButton(
                  color: Color(0xFFFF691F),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  onPressed: () {},
                  child: Text(
                    'Read Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
          bottom: -28,
          right: 0,
        )
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class ComicPreviewDynamicHeaderArgs {
  final String title;
  final String imageUrl;
  final VoidCallback readNow;

  ComicPreviewDynamicHeaderArgs(
      {@required this.title, @required this.imageUrl, this.readNow});
}
