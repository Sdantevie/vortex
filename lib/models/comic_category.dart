import 'package:meta/meta.dart';

import 'comic.dart';

class ComicCategory {
  final int id;
  final String title;
  final String imageUrl;
  final String summary;
  final List<String> tags;

  final List<Comic> comics;

  ComicCategory(
      {@required this.title,
      @required this.imageUrl,
      this.id,
      this.summary = '',
      this.tags,
      this.comics});
}
