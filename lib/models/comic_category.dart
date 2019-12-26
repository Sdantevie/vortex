import 'package:meta/meta.dart';

import 'comic.dart';

class ComicCategory {
  final String title;
  final String imageUrl;
  final String summary;

  final List<Comic> comics;

  ComicCategory(
      {@required this.title,
      @required this.imageUrl,
      this.summary = '',
      @required this.comics});
}
