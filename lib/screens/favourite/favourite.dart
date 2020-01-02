import 'package:flutter/material.dart';
import 'package:vortex/models/comic.dart';
import 'package:vortex/screens/home/comic_card.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var _comics = [
    Comic(
        title: 'Secret Society #1: Re-Legion III',
        summary:
            'The end times are drawing near. The gates of limbo quiver as the morning star brings imminent darkness closer. We…',
        imageUrl:
            'https://vortex247.com/wp-content/uploads/2017/08/Secret-Society-1-Re-Legion-III-e1549557023939.jpg'),
    // Comic(
    //     title: 'Secret Society #0 – Original Sin',
    //     summary:
    //         'Discover the dark side of the Spirit, Re-Legion a 33 year old catholic priest has begun to have a series…',
    //     imageUrl:
    //         'https://vortex247.com/wp-content/uploads/2019/03/Secret-Society-0-Cover-1080x675.jpg'),
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
            'https://vortex247.com/wp-content/uploads/2019/03/Ojuju-1-Cover.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 10.0,
          ),
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  _buildGridItem(context, index),
              childCount: _comics.length),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0));
  }

  _buildGridItem(BuildContext context, int index) {
    return ComicCard(
      comic: _comics[index],
    );
  }
}
