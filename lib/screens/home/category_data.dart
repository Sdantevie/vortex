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
            '''The Dark Side of the SPIRIT is unveiled. An epic adult graphic novel based off African urban legends,  goes deep into the the hidden world of the SPIRIT REALM, the cults which have existed and goverened affairs since the beginning of time, thier politics and a murder mystery which if left unsolved would lead to infinite chaos''',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/11/FLK-Slide.jpg'),
    ComicCategory(
        title: 'Agbara',
        id: 45,
        comics: _getComics(appBloc, 45),
        summary:
            '''For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places". - Ephesians 6:12 KJV.''',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-agbara-1.jpg'),
    ComicCategory(imageUrl: 'https://vortex247.com/wp-content/uploads/2019/12/ZODIAC.jpg',
    summary: '''
Centuries ago, the Dogon tribe of Mali discovered the sacred scroll of Timbuktu which gifted chosen Dogon children mystical powers of the ZODIAC. However, with great powers come's enemies, a great war spurs between the humble tribe of the DOGON against the great dynasty of Pharoah of Egypt Khufu for the powers and knowledge of the ZODIAC. This is the story of DANKARAN KIETA.
''', title: 'ZODIAC', comics: _getComics(appBloc, 90), id: 90),
    ComicCategory(
      title: 'BADGAIS', 
      id: 50,
      summary: '''Dancing with the devil. As supernaturals begin to surface across Nigeria and the rest of the continent, a task force has been put together by the NPF (Nigerian Police Force) to seek the roots to the increased paranormal occurrence. However, even the ones seeking the truth are deeply entangled in this spiritual web.Emi Aago''',
      imageUrl: 'https://vortex247.com/wp-content/uploads/2019/02/slide-badgais.jpg',
      comics: _getComics(appBloc, 50) )
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