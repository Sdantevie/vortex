import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/app_data.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  final AppData data;

  AppLoadedState({@required this.data});

  @override
  List<Object> get props => [data];
}

class AppErrorState extends AppState {}

/***
 * Checking For NetWork Connectivity
 * Implement the remaining blocs
 * Fetch Tags
 */
