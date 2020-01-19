import 'package:meta/meta.dart';

import 'character.dart';
import 'tags.dart';

class Comic {
  final String imageUrl;
  final int id;
  final int featureMedia;
  final String title;
  final String summary;
  final List<Tags> tags;
  final List<Character> characters;

  Comic(
      {@required this.imageUrl,
      @required this.title,
      this.id,
      this.featureMedia,
      this.summary,
      this.tags,
      this.characters});
}
