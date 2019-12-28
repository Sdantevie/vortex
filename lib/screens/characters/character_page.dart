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
              colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [0.0, 1.0]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _buildScrollable(context)));
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
            title: Text(character.name,
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
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
              )
            ]),
          ),
        )
      ],
    );
  }
}
