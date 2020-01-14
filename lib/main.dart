import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vortex/models/user_provider.dart';
import 'package:vortex/view_utils/user_inherited.dart';

import 'routes.dart';
import 'view_utils/bloc_delegate.dart';

bool firstTime;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  firstTime = preferences.getBool('visited') ?? true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InheritedUser(
      provider: UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: firstTime ? '/' : '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
