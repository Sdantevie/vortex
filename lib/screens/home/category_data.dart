import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vortex/blocs/app_bloc/app_bloc.dart';
import 'package:vortex/blocs/app_bloc/app_states.dart';
import 'package:vortex/models/comic.dart';

import '../../models/comic_category.dart';
import 'package:flutter/material.dart';

List<ComicCategory> getCategories(BuildContext context) {
  final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
  List<ComicCategory> categories = [
    ComicCategory(
        title: 'FolkTales',
        comics: _getComics(appBloc, 88),
        id: 88,
        summary:
            '''The Dark Side of the SPIRIT is unveiled. An epic adult graphic novel based off African urban legends,  goes deep into the the hidden 
        world of the SPIRIT REALM, the cults which have existed and goverened
        affairs since the beginning of time, thier politics and a murder mystery 
        which if left unsolved would lead to infinite chaos''',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/11/FLK-Slide.jpg'),
    ComicCategory(
        title: 'Agbara',
        id: 45,
        summary:
            '''For we wrestle not against flesh and blood, but against principalities, against powers, 
        against the rulers of the darkness of this world, against spiritual<br style="min-height: 0px; min-width: 0px; line-height: 25px; border-width: 0px; margin: 0px; padding: 0px; letter-spacing: 0px; font-size: 18px;">
        wickedness in high places". - Ephesians 6:12 KJV.''',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-agbara-1.jpg'),
  ];

  return categories;
}

List<Comic> _getComics(AppBloc appBloc, int id) {
  List<Comic> comics = (appBloc.state as AppLoadedState).data.comics;
  List<Comic> returnedComic = [];

  comics.forEach((comic) {
    if (comic.category == id) {
      returnedComic.add(comic);
    }
  });

  return returnedComic;
}
