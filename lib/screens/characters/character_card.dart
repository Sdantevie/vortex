import 'package:flutter/material.dart';
import 'package:vortex/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  CharacterCard({@required this.character});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/character',
          arguments: character,
        );
      },
      dense: true,
      leading: Image.network(character.imageUrl),
      title: Text(character.name,
          style: TextStyle(color: Color(0xFFD71786), fontSize: 17.0)),
      subtitle: Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                character.summary,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 12.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: OutlineButton(
                  borderSide: BorderSide(color: Color(0xFFFF691F)),
                  splashColor: Color(0xFFFF691F),
                  color: Colors.transparent,
                  child: Text(
                    'Find in Library',
                    style: TextStyle(color: Color(0xFFFF691F)),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )),
    );
  }
}
