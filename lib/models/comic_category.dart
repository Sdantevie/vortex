import 'package:meta/meta.dart';

import 'comic.dart';

class ComicCategory {
  final String title;
  final String imageUrl;

  final List<Comic> comics;

  ComicCategory(
      {@required this.title, @required this.imageUrl, @required this.comics});
}
