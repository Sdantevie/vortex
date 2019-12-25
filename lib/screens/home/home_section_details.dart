import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/screens/home/home_section.dart';

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
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          expandedHeight: 80.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(this.args.title,
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
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
    return Container(
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
            Navigator.of(context).pushNamed('/comic_preview',
                arguments: this.args.comics[index]);
          },
          child: Image.network(
            this.args.comics[index].imageUrl,
            fit: BoxFit.contain,
          ),
        ));
  }
}

class HomeSectionDetailsArgs {
  final String title;
  final List<Comic> comics;

  HomeSectionDetailsArgs({@required this.title, @required this.comics});
}
