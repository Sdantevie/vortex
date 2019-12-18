import 'package:flutter/material.dart';

import '../../models/character.dart';
import 'character_tab_selector.dart';

class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {

  CharacterRole _currentRole = CharacterRole.GOOD_GUY;
  List<Character> _characters = [
    Character(
      name: 'The Mortar', 
      characterRole: CharacterRole.GOOD_GUY,
      imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Mortar.png',
      summary: ''' 
      The shorter one of the two main protagonists is a loud mouth and generally just a rough person which why 
      way he always being blamed for his counterpart’s actions. 
      He is Chubby, rough and ever smiling. Except when his bush meat has been stolen.
      '''
    ),
    Character(
      name: 'Kenga', 
      characterRole: CharacterRole.VILLAIN,
      imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Kenga.png',
      summary: ''' One of the main antagonists is a deity whom just wants to fool around with lives 
      of people especially the ones that owe him. He is a huge intimidating figure in tattered bloodstained
      wrapper and headband, his skin is supposed to feel like stone. 
      He has two big machetes that double as a stool.'''
    ),
    Character(
      imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Anikulapo.png',
      name: 'Anikulapo',
      summary: '''
      Anikulapo the 3rd is summoner from a heritage of super naturals known as “The Voice of the Orisha”. 
      He holds the ability to summon gods and conjure powers through music. 
      He uses his power to battle corrupt politics and spirit beings.
      ''',
      characterRole: CharacterRole.IN_BETWEEN
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CharacterTabSelector(
            onItemSelected: (index){
              setState(() {
                _currentRole = index;
              });
            },
          ),
         ... _characters.map((character){
            return character.characterRole == _currentRole ? 
              CharacterCard(character: character) :
              Container(); 
          }).toList()
        ],
      )
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;
  CharacterCard({@required this.character});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(character.imageUrl),
        Text(character.name, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
