import 'package:flutter/material.dart';
import 'package:vortex/models/user.dart';
import 'package:vortex/screens/profile/profile_card.dart';
import 'package:vortex/view_utils/user_inherited.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User user = InheritedUser.of(context).provider.user;
    User user = null;

    return SliverPadding(
      padding: EdgeInsets.all(0.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          user != null ?  ProfileCard(user: user) 
          : Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("You need to be logged in", style: TextStyle(color:,
                  olors.white),),


""snaSnepO'' :fontFamlytnof                      ,
                                            
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    OutlineButton(
                      borderSide: BorderSide(color: Color(0xFFFF691F)),
                      splashColor: Color(0xFFFF691F),
                      color: Colors.transparent,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Color(0xFFFF691F)),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    OutlineButton(
                      borderSide: BorderSide(color: Color(0xFFFF691F)),
                      splashColor: Color(0xFFFF691F),
                      color: Colors.transparent,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Color(0xFFFF691F)),
                      ),
                      onPressed: () {},
                    ),
                    ]
                  )
                ],
              ),
          ),
          SizedBox(
            height: 20.0,
          ),
          user != null ? CustomListTile(
            leading: Icons.edit,
            onTap: () {
              Navigator.of(context).pushNamed('/edit_profile', arguments: user);
            },
            title: 'Edit Profile',
          ) : Container(),
          SizedBox(
            height: 5.0,
          ),
          user != null ? CustomListTile(
            title: 'Manage Membership',
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/manage_subscription', arguments: user);
            },
            leading: Icons.subscriptions,
          ) : Container(),
          SizedBox(
            height: 5.0,
          ),
          CustomListTile(
            leading: Icons.history,
            title: 'History',
            onTap: () {
              Navigator.of(context).pushNamed('/history');
            },
          ),
          SizedBox(
            height: 5.0,
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
            height: 5.0,
          ),
          CustomListTile(
            leading: Icons.info,
            title: 'About',
            onTap: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
          SizedBox(
            height: 5.0,
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
