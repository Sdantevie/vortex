import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
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

  String _getComicUrl(){
    return 'https://vortex247.com/wp-content/uploads/2019/12/Folktales-2-Compressed.pdf';
  }

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: ComicPreviewDynamicHeader(
              args: ComicPreviewDynamicHeaderArgs(
                  comic: comic,
                  comicUrl: _getComicUrl())),
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
              (comic.characters != null && comic.characters.isNotEmpty)
                  ? Padding(
                      padding: EdgeInsets.all(0.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
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
                              children: comic.characters
                                  .map(
                                    (character) => Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                '/character',
                                                arguments: character);
                                          },
                                          child: Image.network(
                                            character.imageUrl,
                                            width: 50.0,
                                            height: 50.0,
                                          )),
                                    ),
                                  )
                                  .toList())
                        ],
                      ),
                    )
                  : Container()
            ]),
          ),
        )
      ],
    );
  }
}
