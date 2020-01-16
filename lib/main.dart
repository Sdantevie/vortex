import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/app_bloc/app_bloc.dart';
import 'models/user_provider.dart';
import 'repositories/app_repository.dart';
import 'routes.dart';
import 'view_utils/bloc_delegate.dart';
import 'view_utils/user_inherited.dart';

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
    final appRepository = AppRepository(httpClient: http.Client());
    return InheritedUser(
        provider: UserProvider(),
        child: BlocProvider<AppBloc>(
          create: (BuildContext context) =>
              AppBloc(appRepository: appRepository),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: firstTime ? '/' : '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ));
  }
}
