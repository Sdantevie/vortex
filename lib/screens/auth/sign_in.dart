import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

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
          body: _buildScrollable(),
        ));
  }

  _buildScrollable() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 4.0,
          pinned: true,
          backgroundColor: Color(0xFF2A2E3D),
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
            title: Text('Login',
                style: TextStyle(
                    color: Color(0xFFD71786), fontFamily: 'OpenSans')),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 44.0, left: 16.0, right: 16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              TextField(
                  cursorColor: Color(0xFFFF691F),
                  style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
                  decoration: _generateDecoration('Username')),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: true,
                  cursorColor: Color(0xFFFF691F),
                  style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
                  decoration: _generateDecoration('Password')),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    color: Color(0xFFFF691F),
                    splashColor: Color(0xFFD71786),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'OpenSans'),
                    ),
                  )
                ],
              )
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
}
