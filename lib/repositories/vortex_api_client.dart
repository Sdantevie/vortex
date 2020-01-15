import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class VortexAPIClient {
  static const baseUrl = 'https://vortex247.com/wp-json/wp/v2/';
  final http.Client httpClient;
  
  VortexAPIClient({@required this.httpClient}): assert(httpClient != null);

  Future<dynamic> get(String endpoint) async {
    try {
      final getResponse = await this.httpClient.get(baseUrl + endpoint);
      final getReponseJSON = jsonDecode(getResponse.body);
      return getReponseJSON;
    } catch(Exception) {
      throw("Http Error");
    }
  }
}