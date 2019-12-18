import 'package:meta/meta.dart';

class Character {
  
  final String imageUrl;
  final String name;
  final String summary;
  final List<String> abilities;
  final List<String> weapons;
  final CharacterRole characterRole;

  Character({@required this.imageUrl, @required this.name, @required this.characterRole, this.abilities, this.summary, this.weapons});
}

enum CharacterRole {
  GOOD_GUY,
  IN_BETWEEN,
  VILLAIN
}