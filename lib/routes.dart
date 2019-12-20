import 'package:flutter/material.dart';
import 'package:vortex/screens/app_container.dart';
import 'models/character.dart';
import 'screens/characters/character_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppContainer());
      case '/character':
        if(args is Character){
          return MaterialPageRoute(builder: (_) => CharacterPage(character: args,));
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
