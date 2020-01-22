import 'package:equatable/equatable.dart';
import 'package:vortex/models/comic.dart';

import '../../models/comic_category.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadingDataEvent extends HomeEvent {}

class HomeLoadDataEvent extends HomeEvent {
  final List<Comic> comic;

  const HomeLoadDataEvent({@required this.comic});

  @override
  List<Object> get props => [comic];
}
