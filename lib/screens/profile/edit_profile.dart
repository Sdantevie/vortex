import 'package:flutter/material.dart';
import 'package:vortex/models/user.dart';

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile({@required this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF2A2E3D), Color(0xFF040313)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [0.0, 1.0]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildScrollable(context),
        ));
  }

  _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 4.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Color(0xFFFF691F),
              ),
              onPressed: () {},
            )
          ],
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          expandedHeight: 80.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Edit Profile',
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            top: 12.0,
            bottom: 16.0,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  height: 200,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 200.0,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Container(
                              child: (widget.user.avatarUrl != null &&
                                      widget.user.avatarUrl.isNotEmpty)
                                  ? Image.network(widget.user.avatarUrl)
                                  : Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFF691F)),
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          _generateAvatarText(widget.user),
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: Colors.white,
                                              fontSize: 50.0),
                                        ),
                                      ),
                                    ),
                            ),
                            Positioned(
                                bottom: 6,
                                right: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2A2E3D),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFFFF691F),
                                    ),
                                    onPressed: () {},
                                  ),
                                ))
                          ],
                        ),
                      ))),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Username'))),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      obscureText: true,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Password'))),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Email'))),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      keyboardType: TextInputType.phone,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Phone Number'))),
              SizedBox(
                height: 26.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Name',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Color(0xFFD71786),
                        fontSize: 20.0)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('First Name'))),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Last Name'))),
              SizedBox(
                height: 26.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Contact Info',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Color(0xFFD71786),
                        fontSize: 20.0)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      keyboardType: TextInputType.url,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Website'))),
              SizedBox(
                height: 26.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('About Yourself',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Color(0xFFD71786),
                        fontSize: 20.0)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFFFF691F),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'OpenSans'),
                      decoration: _generateDecoration('Biographical Info')))
            ]),
          ),
        )
      ],
    );
  }

  InputDecoration _generateDecoration(String label) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: -2.0, horizontal: 10.0),
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: 'OpenSans', color: Color(0xFFFF691F), fontSize: 17.0),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF691F))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF691F))));
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
