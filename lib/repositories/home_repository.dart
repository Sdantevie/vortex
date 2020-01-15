import '../blocs/home_bloc/home_data.dart';
import 'vortex_api_client.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final VortexAPIClient apiClient;
  HomeRepository({@required this.apiClient}): assert(apiClient != null);
  
  Future<HomeData> getHomeData(){
    
  }
}