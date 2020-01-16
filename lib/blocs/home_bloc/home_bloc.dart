import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../app_bloc/app_bloc.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppBloc appBloc;
  HomeBloc({@required this.appBloc}) : assert(appBloc != null);
  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadDataEvent) {
      yield HomeLoadingState();
      try {} catch (_) {
        yield HomeErrorState();
      }
    }
  }
}
