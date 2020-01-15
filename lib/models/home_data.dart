import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import 'package:meta/meta.dart';

class HomeData {
  final List<Comic> comics;
  final List<ComicCategory> categories;

  HomeData({@required this.comics, @required this.categories}); 
}