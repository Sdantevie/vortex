import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/screens/home/comic_card.dart';

class HomeSectionDetails extends StatelessWidget {
  final HomeSectionDetailsArgs args;
  const HomeSectionDetails({Key key, @required this.args}) : super(key: key);

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

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 4.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          expandedHeight: 70.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(this.args.title,
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      _buildGridItem(context, index),
                  childCount: this.args.comics.length),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0))
      ],
    );
  }

  _buildGridItem(BuildContext context, int index) {
    // return Container(
    //     color: Colors.white,
    //     // decoration: BoxDecoration(
    //     //     borderRadius: BorderRadius.circular(10.0),
    //     //     boxShadow: [
    //     //       BoxShadow(
    //     //           color: Colors.black54,
    //     //           offset: Offset(0.0, 4.0),
    //     //           blurRadius: 1.0)
    //     //     ]),
    //     child: GestureDetector(
    //       onTap: () {
    //         Navigator.of(context).pushNamed('/comic_preview',
    //             arguments: this.args.comics[index]);
    //       },
    //       child: Image.network(
    //         this.args.comics[index].imageUrl,
    //         fit: BoxFit.cover,
    //       ),
    //     ));

    return ComicCard(
      comic: this.args.comics[index],
    );
  }
}

class HomeSectionDetailsArgs {
  final String title;
  final List<Comic> comics;

  HomeSectionDetailsArgs({@required this.title, @required this.comics});
}
