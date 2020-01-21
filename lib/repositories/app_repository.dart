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

      final data = AppData(
          tags: _processTags(response[1]),
          category: _processComicCategory(response[3]),
          comics: comics);
      return data;

      // category: comicCategory);
    } finally {
      this.httpClient.close();
    }
  }

  List<Tags> _processTags(http.Response response) {
    List<Tags> listOfTags = [];
    final List<dynamic> jsonContent = jsonDecode(response.body);
    jsonContent.forEach((content) {
      final tagData = content as Map<String, dynamic>;
      var tag = Tags(id: tagData['id'], name: tagData['name']);
      listOfTags.add(tag);
    });
    return listOfTags;
  }

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

  List<ComicCategory> _processComicCategory(http.Response response) {
    List<ComicCategory> listOfComicCategories = [];
    final List<dynamic> jsonContent = jsonDecode(response.body);
    jsonContent.forEach((content) {
      final comicCategoryData = content as Map<String, dynamic>;
      // final comicTagData = comicData['tags'] as List<int>;
      var comic = ComicCategory(
        title: comicCategoryData['name'],
        summary: _processSummary(comicCategoryData['description']),
        //imageUrl: _getImageUrl(comicData['featured_media']),
        // tags: comicTagData.map(_processComicTags).toList());
      );
      listOfComicCategories.add(comic);
    });

    return listOfComicCategories;
  }

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
