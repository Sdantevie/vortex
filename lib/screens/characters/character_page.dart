import 'package:flutter/material.dart';
import 'package:vortex/models/character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  const CharacterPage({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF040313), Color(0xFF2A2E3D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 16,
                  left: 20,
                  child: Image.asset(
                    "assets/images/vortex247.png",
                    width: ScreenUtil.getInstance().setWidth(70),
                    height: ScreenUtil.getInstance().setHeight(70),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  child: Text(character.name,
                      style:
                          TextStyle(color: Color(0xFFD71786), fontSize: 19.0)),
                ),
                Positioned(
                  top: 130,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Image.network(
                            character.imageUrl,
                            width: 200.0,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
