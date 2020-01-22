import 'package:meta/meta.dart';

import 'comic.dart';
import 'tags.dart';

class AppData {
  final List<Comic> comics;
   final List<Tags> tags;

  AppData({@required this.comics, this.tags});
}
