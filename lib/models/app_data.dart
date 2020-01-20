import 'package:meta/meta.dart';

import 'comic.dart';
import 'comic_category.dart';
import 'tags.dart';

class AppData {
  final List<Comic> comics;
  final List<ComicCategory> category;
   final List<Tags> tags;

  AppData({@required this.comics, @required this.category, this.tags});
}
