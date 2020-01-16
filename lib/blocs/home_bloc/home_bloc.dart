import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vortex/models/home_data.dart';

import '../app_bloc/app_bloc.dart';
import '../app_bloc/app_states.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppBloc appBloc;
  StreamSubscription appSubscription;
  HomeBloc({@required this.appBloc}) : assert(appBloc != null) {
    appSubscription = appBloc.listen((state) {
      if (state is AppLoadedState) {
        add(HomeLoadDataEvent(
            comic: (appBloc.state as AppLoadedState).data.comics,
            category: (appBloc.state as AppLoadedState).data.category));
      }
    });
  }
  @override
  HomeState get initialState => HomeLoadingState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadDataEvent) {
      yield HomeLoadedState(
          data: HomeData(comics: event.comic, categories: event.category));
    }
  }
}
