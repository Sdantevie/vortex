import 'package:bloc/bloc.dart';

import 'app_events.dart';
import 'app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  @override
  AppState get initialState => throw UnimplementedError();

  @override
  Stream<AppState> mapEventToState(AppEvent event) {
    throw UnimplementedError();
  }
  
}