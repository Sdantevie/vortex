import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';
import 'package:vortex/screens/app_container.dart';
import 'package:vortex/screens/home/comic_category_preview.dart';
import 'package:vortex/screens/home/comic_preview.dart';
import 'package:vortex/screens/home/comic_reader.dart';
import 'package:vortex/screens/home/home_section_details.dart';
import 'package:vortex/screens/onboarding/onboarding.dart';
import 'package:vortex/screens/profile/about.dart';
import 'package:vortex/screens/profile/edit_profile.dart';
import 'package:vortex/screens/profile/history.dart';
import 'package:vortex/screens/profile/manage_subscription.dart';
import 'package:vortex/search.dart';
import 'models/character.dart';

import 'models/user.dart';
import 'screens/characters/character_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppContainer());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => Onboarding());
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
      case '/comic_reader':
        if (args is ComicReaderArgs) {
          return MaterialPageRoute(builder: (_) => ComicReader(args: args));
        }
        return _errorRoute();
      case '/history':
        return MaterialPageRoute(builder: (_) => History());
      case '/about':
        return MaterialPageRoute(builder: (_) => About());
      case '/edit_profile':
        if (args is User) {
          return MaterialPageRoute(builder: (_) => EditProfile(user: args));
        }
        return _errorRoute();
      case '/manage_subscription':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => ManageSubscription(user: args));
        }
        return _errorRoute();
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
