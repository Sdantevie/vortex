import '../models/app_data.dart';
import 'vortex_api_client.dart';
import 'package:meta/meta.dart';

class AppRepository {
  final VortexAPIClient apiClient;
  AppRepository({@required this.apiClient}): assert(apiClient != null);
  
  Future<AppData> getAppData(){
    
  }
}