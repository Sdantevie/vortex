import 'package:flutter/material.dart';
import 'package:vortex/models/character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  const CharacterPage({Key key, @required this.character}) : super(key: key);

  List<TextSpan> _buildAbilities() {
    if (character.abilities != null) {
      return character.abilities.map((ability) {
        var index = character.abilities.indexOf(ability);
        return TextSpan(
            text: '  ' +
                ability +
                (index == character.abilities.length - 1 ? '.' : ','));
      }).toList();
    }

    return [TextSpan(text: '  None')];
  }

  List<TextSpan> _buildWeapons() {
    if (character.weapons != null) {
      return character.weapons.map((weapon) {
        var index = character.weapons.indexOf(weapon);
        return TextSpan(
            text: '  ' +
                weapon +
                (index == character.weapons.length - 1 ? '.' : ','));
      }).toList();
    }

    return [TextSpan(text: '  None')];
  }

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
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
                child: Stack(
              children: <Widget>[
                Positioned(
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear, color: Colors.white),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Text(character.name,
                        style: TextStyle(
                            color: Color(0xFFD71786),
                            fontSize: 22.0,
                            fontFamily: 'OpenSans')),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      child: Image.network(
                        character.imageUrl,
                        width: 240.0,
                        height: 240.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      character.summary,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text.rich(TextSpan(
                        style: TextStyle(
                            fontFamily: 'OpenSans', color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Abilities:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF691F))),
                          ..._buildAbilities()
                        ])),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text.rich(TextSpan(
                        style: TextStyle(
                            fontFamily: 'OpenSans', color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Weapons:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF691F))),
                          ..._buildWeapons()
                        ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        OutlineButton(
                          borderSide: BorderSide(color: Color(0xFFFF691F)),
                          splashColor: Color(0xFFFF691F),
                          color: Colors.transparent,
                          child: Text(
                            'Find in Library',
                            style: TextStyle(color: Color(0xFFFF691F)),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
          )),
    );
  }
}
