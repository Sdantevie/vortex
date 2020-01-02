import 'package:flutter/material.dart';
import 'package:vortex/screens/profile/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(0.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          ProfileCard(),
          SizedBox(
            height: 20.0,
          ),
          CustomListTile(
            leading: Icons.edit,
            onTap: () {},
            title: 'Edit Profile',
          ),
          CustomListTile(
            title: 'Manage Membership',
            onTap: () {},
            leading: Icons.subscriptions,
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomListTile(
            leading: Icons.history,
            title: 'History',
            onTap: () {},
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
            onTap: () {},
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
