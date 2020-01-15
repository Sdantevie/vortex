import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/home_data.dart';

abstract class HomeState extends Equatable{
 const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
}

class HomeLoadedState extends HomeState {
  final HomeData data;

  HomeLoadedState({@required this.data});

  @override
  List<Object> get props => [data];
}

class HomeErrorState extends HomeState {}