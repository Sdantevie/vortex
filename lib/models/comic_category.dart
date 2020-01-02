import 'package:meta/meta.dart';

import 'comic.dart';

class ComicCategory {
  final String title;
  final String imageUrl;
  final String summary;
  final List<String> tags;

  final List<Comic> comics;

  ComicCategory(
      {@required this.title,
      @required this.imageUrl,
      this.summary = '',
      this.tags,
      @required this.comics});
}
