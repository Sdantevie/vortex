import 'package:equatable/equatable.dart';

import '../../models/comic_category.dart';

abstract class HomeEvent extends Equatable {
 const HomeEvent();

}

class HomeLoa

class HomeLoadDataEvent extends HomeEvent {
  final List<Comic> comic;
  final List<ComicCategory> category;

  const HomeLoadDataEvent({@required this.comic, @required this.category});

  @override
  List<Object> get props => [comic, category];
}