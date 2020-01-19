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

  List<String> fetchedParams = ['media', 'tags', 'posts', 'categories'];

  AppRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<AppData> getAppData() async {
    try {
      List<http.Response> response = await Future.wait(fetchedParams.map(
              (param) => httpClient
                  .get('$baseUrl/wp-json/wp/v2/$param/?per_page=100')))
          .catchError((e) => throw Exception());

      mediaData = jsonDecode(response[0].body);
      tagsData = jsonDecode(response[1].body);

      final comics = _processComics(response[2]);

      // final comicCategoryResponse = await httpClient
      //     .get(baseUrl + '/wp-json/wp/v2/categories/?per_page=100');

      // if (comicCategoryResponse.statusCode == 404) {
      //   throw Exception('failure');
      // }

      // final comicCategory = _processComicCategory(comicCategoryResponse);

      final data = AppData(
          // tags: _processTags(tagsResponse),
          comics: comics);
      return data;

      // category: comicCategory);
    } finally {
      this.httpClient.close();
    }
  }

  _processTags(http.Response response) {}

  List<Comic> _processComics(http.Response response) {
    List<Comic> listOfComics = [];
    final List<dynamic> jsonContent = jsonDecode(response.body);
    jsonContent.forEach((content) {
      final comicData = content as Map<String, dynamic>;
      // final comicTagData = comicData['tags'] as List<int>;
      var comic = Comic(
        title: comicData['title']['rendered'],
        summary: _processSummary(comicData['excerpt']['rendered']),
        imageUrl: _getImageUrl(comicData['featured_media']),
        // tags: comicTagData.map(_processComicTags).toList());
      );
      listOfComics.add(comic);
    });

    print(listOfComics[0]);
    return listOfComics;
  }

  String _getImageUrl(int id) {
    String imageUrl = '';
    for (final content in mediaData) {
      final contentMap = content as Map<String, dynamic>;
      if (contentMap['id'] == id) {
        imageUrl = baseUrl +
            '/wp-content/uploads/' +
            contentMap['media_details']['file'];
        break;
      }
    }
    return imageUrl;
  }

  String _processSummary(String summaryData) {
    return 'Hello';
  }

  List<ComicCategory> _processComicCategory(http.Response response) => [];
  Tags _processComicTags(int id) {
    Tags tag;
    for (final content in tagsData) {
      final tagContent = content as Map<String, dynamic>;
      if (tagContent['id'] == id) {
        tag = Tags(name: tagContent['name'], id: tagContent['id']);
      }
    }

    return tag;
  }
}
