import 'dart:convert';

import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import '../models/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../models/tags.dart';

class AppRepository {
  static const baseUrl = 'https://vortex247.com';
  final http.Client httpClient;
  List<dynamic> mediaData = [];
  List<dynamic> tagsData = [];

  AppRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<AppData> getAppData() async {
    try {
      final mediaResponse = await httpClient.get(baseUrl + '/wp-json/wp/v2/media/?per_page=100');
       if (mediaResponse.statusCode == 404) {
        throw Exception('failure');
      }
      mediaData = jsonDecode(mediaResponse.body);

      final tagsResponse = await httpClient.get(baseUrl + '/wp-json/wp/v2/tags/?per_page=100');
      if (tagsResponse.statusCode == 404) {
        throw Exception('failure');
      }

      tagsData = jsonDecode(tagsResponse.body);

      final comicsResponse =
          await httpClient.get(baseUrl + '/wp-json/wp/v2/posts/?per_page=100');
      if (comicsResponse.statusCode == 404) {
        throw Exception('failure');
      }
      final comics = _processComics(comicsResponse);

      final comicCategoryResponse =
          await httpClient.get(baseUrl + '/wp-json/wp/v2/categories/?per_page=100');

      if (comicCategoryResponse.statusCode == 404) {
        throw Exception('failure');
      }

      final comicCategory = _processComicCategory(comicCategoryResponse);

      return AppData(tags: tags, comics: comics, category: comicCategory);

    } finally {
      this.httpClient.close();
    }
  }

  List<Comic> _processComics(http.Response response) {
    List<Comic> listOfComics = [];
    final List<dynamic> jsonContent = jsonDecode(response.body);
    jsonContent.forEach((content) {
      final comicData = content as Map<String, dynamic>;
      final comicTagData = comicData['tags'] as List<int>;
      var comic = Comic(
        title: comicData['title']['rendered'], 
        summary: _processSummary(comicData['excerpt']['rendered']),
        imageUrl: _getImageUrl(comicData['featured_media']),
        tags: comicTagData.map(_processComicTags).toList()
      );

      listOfComics.add(comic);
    });

    print(listOfComics.length);

    return listOfComics;
  }

  String _getImageUrl(int id){
    String imageUrl = '';
    for(final content in mediaData){
      final contentMap = content as Map<String, dynamic>;
      if(contentMap['id'] == id){
        imageUrl = baseUrl + '/wp-content/uploads/' + contentMap['media_details']['file'];
        break;
      }
    }
    return imageUrl;
  }

  String _processSummary(String summaryData){

  }

  List<ComicCategory> _processComicCategory(http.Response response) => [];
  Tags _processComicTags(int id) {

  }
}
