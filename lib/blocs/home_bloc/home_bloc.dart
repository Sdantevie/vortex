import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/repositories.dart';
import 'home_data.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository}) : assert(homeRepository != null);

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is HomeLoadDataEvent){
      yield HomeLoadingState();
      try {
        final HomeData homeData = await homeRepository.getHomeData();
        yield HomeLoadedState(data: homeData);
      } catch (_) {
        yield HomeErrorState();
      }
    }
  }
  
}