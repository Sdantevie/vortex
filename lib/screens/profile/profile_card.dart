import 'package:flutter/material.dart';
import 'package:vortex/models/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: (user.avatarUrl != null && user.avatarUrl.isNotEmpty)
                ? Image.network(user.avatarUrl)
                : Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFFF691F)),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        _generateAvatarText(user),
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.username,
                  style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'OpenSans',
                      color: Colors.white),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'OpenSans',
                      color: Colors.white),
                ),
                SizedBox(
                  height: 4.0,
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Membership: ',
                        style: TextStyle(
                            color: Color(0xFFd71786), fontSize: 15.0)),
                    TextSpan(
                      text: user.subscription,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String _generateAvatarText(User user) {
    List<String> subStrings = user.username.split(' ');
    String initials = '';
    subStrings.forEach((string) {
      initials += string[0];
    });

    return initials;
  }
}
