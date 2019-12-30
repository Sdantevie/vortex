import 'package:flutter/material.dart';

import '../../models/character.dart';
import 'character_card.dart';

class CharactersContent extends StatelessWidget {
  final TabController tabController;
  CharacterRole currentRole = CharacterRole.GOOD_GUY;

  CharactersContent({@required this.tabController});

  List<Character> _characters = [
    Character(
        name: 'The Mortar',
        characterRole: CharacterRole.GOOD_GUY,
        imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Mortar.png',
        summary:
            '''The shorter one of the two main protagonists is a loud mouth and generally just a rough person which why way he always being blamed for his counterpart’s actions. He is Chubby, rough and ever smiling. Except when his bush meat has been stolen.'''),
    Character(
        name: 'Kenga',
        characterRole: CharacterRole.VILLAIN,
        imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Kenga.png',
        summary:
            '''One of the main antagonists is a deity whom just wants to fool around with lives of people especially the ones that owe him. He is a huge intimidating figure in tattered bloodstained wrapper and headband, his skin is supposed to feel like stone. He has two big machetes that double as a stool.'''),
    Character(
        weapons: ['Guns', 'Arrows'],
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2017/08/Anikulapo.png',
        name: 'Anikulapo',
        summary:
            '''Anikulapo the 3rd is summoner from a heritage of super naturals known as “The Voice of the Orisha”. He holds the ability to summon gods and conjure powers through music. He uses his power to battle corrupt politics and spirit beings.''',
        characterRole: CharacterRole.IN_BETWEEN),
    Character(
        name: 'Pestle',
        imageUrl: 'https://vortex247.com/wp-content/uploads/2017/08/Pestle.png',
        summary:
            'Pestle is cool, calm and collected. He is just as rash but not as outspoken and often seems to appear responsible. He is Tall, buff and bald. He is a thinker and more often than not gets the duo out of tough situation with both his strength and wit; he has a very soft spot for Ejule who he refers to as “aunty” as he enjoys both her wisdom and cooking',
        abilities: ['Strength', 'Juju Charge'],
        weapons: ['A huge shape-shifting club called “Igwe”'],
        characterRole: CharacterRole.GOOD_GUY),
  ];

  List<String> _tabs = ['Good Guys', 'In-Betweens', 'Villain'];

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
          controller: this.tabController,
          children: _tabs
              .map(
                (tab) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: _characters.map((character) {
                        return character.characterRole == this.currentRole
                            ? CharacterCard(character: character)
                            : Container();
                      }).toList(),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
