import 'package:bloc/bloc.dart';
import '../../repositories/app_repository.dart';
import 'app_events.dart';
import 'app_states.dart';
import 'package:meta/meta.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository appRepository;
  AppBloc({@required this.appRepository});
  @override
  AppState get initialState => AppInitialState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppLoadDataEvent) {
      yield AppLoadingState();
      try {
        final appData = await appRepository.getAppData();
        yield AppLoadedState(data: appData);
      } on Exception catch (e) {
        print('$e');
        yield AppErrorState();
      }
    }
  }
}
