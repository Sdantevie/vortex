import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([]),
      ),
    );
  }
}
