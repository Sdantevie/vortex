import 'package:meta/meta.dart';

class Comic {
  final String imageUrl;
  final String title;
  final String summary;

  Comic({@required this.imageUrl, @required this.title, this.summary});
}
