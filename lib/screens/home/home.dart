import 'package:flutter/material.dart';
import 'package:vortex/models/character.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/models/comic_category.dart';

import 'home_section.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  List<Comic> _comicsCover = [
    Comic(
        title: 'FolkTales',
        summary:
            'As Madam Koi Koi and her band of Folktales investigate the murder of the holy priest times races against them as the angels prepare to retaliate. Meanwhile Bush Baby runs into some friends from his past which leads to only more deeper discoveries.',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/11/FLK-COVER.jpg',
        tags: [
          'Action',
          'Supernatural',
          'Classic'
        ],
        characters: [
          Character(
              name: 'The Mortar',
              characterRole: CharacterRole.GOOD_GUY,
              imageUrl:
                  'https://vortex247.com/wp-content/uploads/2017/08/Mortar.png',
              summary:
                  '''The shorter one of the two main protagonists is a loud mouth and generally just a rough person which why way he always being blamed for his counterpart’s actions. He is Chubby, rough and ever smiling. Except when his bush meat has been stolen.'''),
          Character(
              name: 'Kenga',
              characterRole: CharacterRole.VILLAIN,
              imageUrl:
                  'https://vortex247.com/wp-content/uploads/2017/08/Kenga.png',
              summary:
                  '''One of the main antagonists is a deity whom just wants to fool around with lives of people especially the ones that owe him. He is a huge intimidating figure in tattered bloodstained wrapper and headband, his skin is supposed to feel like stone. He has two big machetes that double as a stool.'''),
        ]),
    Comic(
        title: 'Wraith House',
        summary:
            'The Chimera is aware of the Wrath House plot against them using Antoli Umar as a tool to expose and..',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/03/Wrath-House-2-Cover-e1552046913663.jpg'),
    Comic(
        title: 'Anikulapo #1: Orishirishi',
        summary:
            'Anikulapo III is from a ancestral family of summoners, gifted with power to summon deities and celestial beast through music',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/10/Anikulapo.jpg'),
    Comic(
        title: 'Nollywood Comics – Love In Lagos #1',
        summary:
            'Welcome to Sidi’s world, a beautiful working class lady at the prime of life, till she meets Jake. THE LAGOS…',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2017/08/NOLLYWOOD-COMICS.jpg'),
    Comic(
        title: 'SPIRIT WARS #1 – Requiem',
        summary:
            'When Ajagbeja, General of Sango, heralds the Eternals to war against the angels on the celestial plain the events in….',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2017/08/SPIRIT-WARS-1-Requiem-e1549555863194.jpg'),
    Comic(
        title: 'Ojuju #1 – Marabadua',
        summary:
            'Ojuju is on the run with Aralia “The One he is sworn to protect” little do they know what hunts…',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/03/Ojuju-1-Cover.jpg')
  ];

  //List<String> _list = ['Trending Now', 'Latest Release', 'Vortex Mini'];
  List<ComicCategory> _comicCategories = [
    ComicCategory(
        comics: [],
        title: 'JUNE XII',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-junexii.jpg'),
    ComicCategory(
        comics: [
          Comic(
              title: 'Secret Society #1: Re-Legion III',
              summary:
                  'The end times are drawing near. The gates of limbo quiver as the morning star brings imminent darkness closer. We…',
              imageUrl:
                  'https://vortex247.com/wp-content/uploads/2017/08/Secret-Society-1-Re-Legion-III-e1549557023939.jpg'),
          Comic(
              title: 'Secret Society #0 – Original Sin',
              summary:
                  'Discover the dark side of the Spirit, Re-Legion a 33 year old catholic priest has begun to have a series…',
              imageUrl:
                  'https://vortex247.com/wp-content/uploads/2019/03/Secret-Society-0-Cover-1080x675.jpg'),
        ],
        summary:
            'Discover the dark side of the spirit in a gripping cross universe series which delves deep into the stories of the Masquerades, Wildings and Celestials. Every 100 years the world is gifted with a RE-LEGION a supernatural being with the ability to command the faith of all men, but with that gift brings impending doom of the apocalypse; it opens the door for Lucifer itself.',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-secretsociety.jpg',
        title: 'Secret Society'),
    ComicCategory(
        comics: [],
        tags: ['Action', 'Supernatural', 'Graphic'],
        title: 'BADGAIS',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2019/02/slide-badgais.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _comicCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return _comicShowcase(context, index);
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          child: HomeSection(title: 'Trending Now', comics: _comicsCover),
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          child: HomeSection(title: 'Latest Release', comics: _comicsCover),
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          child: HomeSection(title: 'Vortex Mini', comics: _comicsCover),
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
        ),
      ]),
      //padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
    );
  }

  _comicShowcase(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/comic_category_preview',
                arguments: _comicCategories[index]);
          },
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200.0,
            width: Curves.easeInOut.transform(value) * 450.0,
            child: widget,
          ),
        ));
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.2, 0.1),
                        blurRadius: 4.0)
                  ]),
              child: Center(
                child: Hero(
                  tag: _comicCategories[index].title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      _comicCategories[index].imageUrl,
                      height: 160.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 30,
              bottom: 40,
              child: Container(
                child: Text(
                  _comicCategories[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
