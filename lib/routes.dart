import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import 'package:vortex/screens/app_container.dart';
import 'package:vortex/screens/home/comic_category_preview.dart';
import 'package:vortex/screens/home/comic_preview.dart';
import 'package:vortex/screens/home/home_section_details.dart';
import 'package:vortex/search.dart';
import 'models/character.dart';

import 'screens/characters/character_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppContainer());
      case '/character':
        if (args is Character) {
          return MaterialPageRoute(
              builder: (_) => CharacterPage(
                    character: args,
                  ));
        }
        return _errorRoute();
      case '/comic_preview':
        if (args is Comic) {
          return MaterialPageRoute(
              builder: (_) => ComicPreview(
                    comic: args,
                  ));
        }
        return _errorRoute();
      case '/home_section':
        if (args is HomeSectionDetailsArgs) {
          return MaterialPageRoute(
              builder: (_) => HomeSectionDetails(
                    args: args,
                  ));
        }
        return _errorRoute();
      case '/comic_category_preview':
        if (args is ComicCategory) {
          return MaterialPageRoute(
              builder: (_) => ComicCategoryPreview(category: args));
        }
        return _errorRoute();
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Sorry not found",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ));
  }
}
