import 'character.dart';
import 'comic.dart';
import 'comic_category.dart';
import 'package:meta/meta.dart';

class AppData {
  final List<Comic> comics;
  final List<ComicCategory> category;
  final List<Character> characters;

  AppData({@required this.comics, @required this.category, @required this.characters});
}