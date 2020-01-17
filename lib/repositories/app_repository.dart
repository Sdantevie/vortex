import 'dart:convert';

import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import 'package:vortex/models/tags.dart';
import '../models/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class AppRepository {
  static const baseUrl = 'https://vortex247.com/wp-json/wp/v2/';
  final http.Client httpClient;
  List<dynamic> mediaData = [];

  AppRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<AppData> getAppData() async {
    try {
      final mediaResponse = await httpClient.get(baseUrl + 'media/?per_page=100');
       if (mediaResponse.statusCode == 404) {
        throw Exception('failure');
      }
      mediaData = jsonDecode(mediaResponse.body);

      final comicsResponse =
          await httpClient.get(baseUrl + 'posts/?per_page=100');
      if (comicsResponse.statusCode == 404) {
        throw Exception('failure');
      }
      final comics = _processComics(comicsResponse);

      final comicCategoryResponse =
          await httpClient.get(baseUrl + 'categories/?per_page=100');

      if (comicCategoryResponse.statusCode == 404) {
        throw Exception('failure');
      }

      final comicCategory = _processComicCategory(comicCategoryResponse);

      final tagsResponse = await httpClient.get(baseUrl + 'tags/?per_page=100');

      if (tagsResponse.statusCode == 404) {
        throw Exception('failure');
      }

      final tags = _processTags(tagsResponse);

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
      var comic = Comic(
        title: comicData['title']['rendered'], 
        summary: _processSummary(comicData['excerpt']['rendered']),
        imageUrl: _getImageUrl(comicData['featured_media']),
      );

      listOfComics.add(comic);
    });

    return listOfComics;
  }

  String _getImageUrl(int id){

  }

  String _processSummary(String summaryData){

  }

  List<ComicCategory> _processComicCategory(http.Response response) => [];
  List<Tags> _processTags(http.Response response) => [];
}
