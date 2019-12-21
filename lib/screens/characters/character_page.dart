import 'package:flutter/material.dart';
import 'package:vortex/models/character.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  const CharacterPage({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          
        )
      ],
    );
  }
}
