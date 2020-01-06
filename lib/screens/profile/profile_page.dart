import 'package:flutter/material.dart';
import 'package:vortex/models/user.dart';
import 'package:vortex/screens/profile/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User(
        username: 's Daniel',
        avatarUrl:
            'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/10_avatar-512.png',
        email: 'dstevie9292@gmail.com',
        subscription: 'Free');
    return SliverPadding(
      padding: EdgeInsets.all(0.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          ProfileCard(user: user),
          SizedBox(
            height: 20.0,
          ),
          CustomListTile(
            leading: Icons.edit,
            onTap: () {
              Navigator.of(context).pushNamed('/edit_profile', arguments: user);
            },
            title: 'Edit Profile',
          ),
          CustomListTile(
            title: 'Manage Membership',
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/manage_subscription', arguments: user);
            },
            leading: Icons.subscriptions,
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomListTile(
            leading: Icons.history,
            title: 'History',
            onTap: () {
              Navigator.of(context).pushNamed('/history');
            },
          ),
          CustomListTile(
            leading: Icons.file_download,
            title: 'Auto Download',
            onTap: () {},
            trailing: Text(
              'On',
              style: TextStyle(color: Colors.grey, fontFamily: 'OpenSans'),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomListTile(
            leading: Icons.info,
            title: 'About',
            onTap: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
          CustomListTile(
            leading: Icons.exit_to_app,
            title: 'Logout',
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData leading;
  final Widget trailing;
  final String title;
  final VoidCallback onTap;

  CustomListTile(
      {@required this.title,
      @required this.leading,
      @required this.onTap,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: <Widget>[
              Icon(
                leading,
                color: Color(0xFFFF691F),
                size: 18.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 17.0),
                    ),
                    trailing != null ? trailing : Container()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
