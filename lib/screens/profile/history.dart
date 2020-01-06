import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

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
        ));
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
          expandedHeight: 80.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('History',
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
      ],
    );
  }
}
